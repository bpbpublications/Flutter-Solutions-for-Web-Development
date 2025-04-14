// Gesture detector example
import 'package:flutter/material.dart';

class MyGestureDetector extends StatelessWidget {
  const MyGestureDetector({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Handle your gesture here
      },
      child: Icon(
        Icons.favorite,
        color: Colors.blue,
        size: 50,
      ),
    );
  }
}
