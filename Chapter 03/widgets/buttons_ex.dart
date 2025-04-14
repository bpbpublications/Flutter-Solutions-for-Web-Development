import 'package:flutter/material.dart';

class MyButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              print('Elevated Button Pressed');
            },
            child: const Text('Elevated Button'),
          ),
          TextButton(
            onPressed: () {
              print('Text Button Pressed');
            },
            child: const Text('Text Button'),
          ),
          OutlinedButton(
            onPressed: () {
              print('Outlined Button Pressed');
            },
            child: const Text('Outlined Button'),
          ),
          IconButton(
            onPressed: () {
              print('Icon Button Pressed');
            },
            icon: const Icon(Icons.star),
          ),
        ],
      ),
    );
  }
}
