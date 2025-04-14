import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: MyCustomTheme(),
    ),
  );
}

class MyCustomTheme extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        primaryColor: Colors.teal,
        focusColor: Colors.amber,
        buttonTheme: const ButtonThemeData(
          buttonColor: Colors.teal,
        ),
        textTheme: const TextTheme(
          headlineMedium:
              TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
        ),
      ),
      child: Scaffold(
        appBar: AppBar(title: const Text('Custom Theme Example')),
        body: const Center(child: Text('Welcome to the themed app!')),
      ),
    );
  }
}
