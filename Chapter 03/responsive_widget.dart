import 'package:flutter/material.dart';

void main() {
  runApp(MyResponsiveWidget());
}

class MyResponsiveWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return MaterialApp(
      home: Scaffold(
        body: Container(
          color: screenSize.width < 600 ? Colors.yellow : Colors.green,
          child: Center(
            child: screenSize.width < 600
                ? const Text('Small Screen', style: TextStyle(fontSize: 48))
                : const Text('Large Screen', style: TextStyle(fontSize: 48)),
          ),
        ),
      ),
    );
  }
}
