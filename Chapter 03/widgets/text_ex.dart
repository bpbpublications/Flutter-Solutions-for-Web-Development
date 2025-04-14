import 'package:flutter/material.dart';

class MyTextWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Text(
      'Welcome, Knight!',
      style: TextStyle(fontSize: 24, color: Colors.blue),
      textAlign: TextAlign.center,
      maxLines: 2,
    );
  }
}
