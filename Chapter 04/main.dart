// main.dart
import 'package:flutter/material.dart';

import 'screens/home/home_screen.dart';

void main() {
  // set MyThemedApp as the entry point
  runApp(const MyThemedApp());
}

class MyThemedApp extends StatelessWidget {
  const MyThemedApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // set the theme for the app
      theme: ThemeData(
          // set the primary color to blue
          primarySwatch: Colors.blue,
          // set the text theme for the app
          textTheme: const TextTheme(
            displayLarge:
                TextStyle(fontSize: 57.0, fontWeight: FontWeight.bold),
            headlineMedium:
                TextStyle(fontSize: 28.0, fontStyle: FontStyle.italic),
            bodyMedium: TextStyle(fontSize: 14.0),
          )),
      home: const MyHomePage(),
    );
  }
}
