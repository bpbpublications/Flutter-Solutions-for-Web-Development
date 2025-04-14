// screens/chat/chatbot_web_interface.dart
import 'package:flutter/material.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:lottie/lottie.dart';

import '../../widgets/chat_widget.dart';

class ChatbotWebInterface extends StatefulWidget {
  final String apiKey;

  const ChatbotWebInterface(this.apiKey, {super.key});

  @override
  State<ChatbotWebInterface> createState() => _ChatbotWebInterfaceState();
}

class _ChatbotWebInterfaceState extends State<ChatbotWebInterface> {
  late final GenerativeModel _model;
  late final ChatSession _chat;
  final TextEditingController _textController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  final FocusNode _textFieldFocus = FocusNode();
  final List<({bool fromUser, String? text})> _generatedContent =
      <({bool fromUser, String? text})>[
    (text: 'Hello! How can I help you today?', fromUser: false),
  ];

  bool _loading = false;
  bool get loading => _loading;
  set loading(bool set) => setState(() => _loading = set);

  @override
  void initState() {
    super.initState();
    _model = GenerativeModel(
      model: 'gemini-1.5-flash-latest',
      apiKey: widget.apiKey,
    );
    _chat = _model.startChat();
  }

  void _scrollDown() {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(
          milliseconds: 750,
        ),
        curve: Curves.easeOutCirc,
      ),
    );
  }

  Future<void> _sendChatMessage(String message) async {
    setState(() {
      loading = true;
    });
    try {
      _generatedContent.add((text: message, fromUser: true));
      final response = await _chat.sendMessage(
        Content.text(message),
      );
      final text = response.text;
      _generatedContent.add((text: text, fromUser: false));
      if (text == null) {
        _showError('No response from API.');
        setState(() {
          _loading = false;
        });
        return;
      } else {
        setState(() {
          _loading = false;
          _scrollDown();
        });
      }
    } catch (e) {
      _showError(e.toString());
      setState(() {
        _loading = false;
      });
    } finally {
      _textController.clear();
      setState(() {
        _loading = false;
      });
      _textFieldFocus.requestFocus();
    }
  }

  void _showError(String message) {
    showDialog<void>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Something went wrong'),
          content: SingleChildScrollView(
            child: SelectableText(message),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            )
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AI Chatbot'),
        leading: const Icon(Icons.mark_chat_unread_sharp),
        actions: [
          IconButton(
            icon: const Icon(Icons.restart_alt_outlined),
            onPressed: () {
              setState(() {
                _generatedContent.clear();
              });
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(children: [
          Expanded(
              child: widget.apiKey.isNotEmpty
                  ? Align(
                      alignment: Alignment.bottomCenter,
                      child: SingleChildScrollView(
                        reverse: true,
                        child: ListView.builder(
                          itemBuilder: (context, idx) {
                            final content = _generatedContent[idx];
                            return ChatWidget(
                              text: content.text,
                              isFromUser: content.fromUser,
                            );
                          },
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          controller: _scrollController,
                          itemCount: _generatedContent.length,
                          reverse: false,
                        ),
                      ),
                    )
                  : ListView(
                      children: const [
                        Text(
                          'No API key found. Please provide an API Key '
                          'using the environment variable GEMINI_API_KEY.',
                        ),
                      ],
                    )),
          if (loading)
            SizedBox(
              width: 150,
              height: 150,
              child: Lottie.asset('animated_loader.json'),
            ),
        ]),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 100),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primaryContainer,
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(20),
            ),
          ),
          padding: const EdgeInsets.all(15),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _textController,
                  focusNode: _textFieldFocus,
                  decoration: const InputDecoration(
                    hintText: 'Type your message',
                    border: InputBorder.none,
                  ),
                  canRequestFocus: true,
                  textInputAction: TextInputAction.send,
                  maxLines: 10,
                  minLines: 1,
                  onSubmitted: _sendChatMessage,
                ),
              ),
              const SizedBox(width: 10),
              Container(
                height: 56,
                width: 56,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: !loading
                    ? IconButton.outlined(
                        onPressed: () async {
                          _sendChatMessage(_textController.text);
                        },
                        icon: const Icon(Icons.send),
                      )
                    : const CircularProgressIndicator(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
