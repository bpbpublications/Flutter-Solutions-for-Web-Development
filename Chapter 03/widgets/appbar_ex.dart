// app bar example
import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({Key? key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('My Shopping List'),
      actions: [
        IconButton(
          icon: const Icon(Icons.search),
          onPressed: () {
            // Handle search action
          },
        ),
        IconButton(
          icon: const Icon(Icons.more_vert),
          onPressed: () {
            // Handle more action
          },
        ),
      ],
    );
  }
}
