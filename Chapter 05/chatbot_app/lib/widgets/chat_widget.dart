// widgets/chat_widget.dart
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class ChatWidget extends StatelessWidget {
  final String? text;
  final bool isFromUser;

  const ChatWidget({
    this.text,
    this.isFromUser = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
            mainAxisAlignment:
                isFromUser ? MainAxisAlignment.end : MainAxisAlignment.start,
            children: [
              if (!isFromUser)
                CircleAvatar(
                    backgroundColor: Theme.of(context).colorScheme.secondary,
                    child: const Icon(Icons.computer)),
              const SizedBox(width: 10),
              if (text != null)
                Container(
                    constraints: BoxConstraints(
                      // 70% of the screen width
                      maxWidth: MediaQuery.of(context).size.width * 0.7,
                    ),
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        color: isFromUser
                            ? Theme.of(context).colorScheme.primary
                            : Theme.of(context).colorScheme.secondary,
                        borderRadius: BorderRadius.circular(10)),
                    child: MarkdownBody(
                      data: text!,
                    )),
              const SizedBox(width: 10),
              if (isFromUser)
                const CircleAvatar(
                  child: Icon(Icons.person),
                )
            ]));
  }
}
