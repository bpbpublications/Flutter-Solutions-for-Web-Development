import 'dart:ui';

import 'package:chatbot/screens/chat/chat_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const ChatBotApp());
}

class ChatBotApp extends StatelessWidget {
  const ChatBotApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "ChatBot",
        theme: ThemeData(
          brightness: Brightness.dark,
          useMaterial3: true,
        ),
        darkTheme: ThemeData.dark().copyWith(
            colorScheme: ThemeData.dark().colorScheme.copyWith(
                primary: Colors.deepPurple.shade800,
                secondary: const Color(0xFF2C282F))),
        home: const ChatScreen(),
        debugShowCheckedModeBanner: false,
        scrollBehavior: const MaterialScrollBehavior().copyWith(dragDevices: {
          PointerDeviceKind.touch,
          PointerDeviceKind.mouse,
          PointerDeviceKind.unknown,
        }));
  }
}
