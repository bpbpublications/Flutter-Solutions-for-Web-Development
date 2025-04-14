import 'package:chatbot/screens/chat/chatbot_web_interface.dart';
import 'package:chatbot/screens/responsive_layout.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});
  // visit https://aistudio.google.com/app/apikey
  final String _apiKey = "YOUR_API_KEY";

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobileLayout: const Placeholder(),
      tabletLayout: const Placeholder(),
      webLayout: ChatbotWebInterface(_apiKey),
    );
  }
}
