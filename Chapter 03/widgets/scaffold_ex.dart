// scaffold example
import 'package:flutter/material.dart';

class MyScaffold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: const Center(
            child: Text(
              'Add Items to Shop! 🛒',
              style: TextStyle(fontSize: 50),
            ),
          ),
          appBar: AppBar(
            title: const Text('My Shopping List'),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              // Add your onPressed code here!
            },
            child: const Icon(Icons.add),
          )),
    );
  }
}
