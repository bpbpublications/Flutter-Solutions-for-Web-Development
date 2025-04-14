// screens/home/home_web.dart
import 'package:flutter/material.dart';

// web layout
class HomeWeb extends StatelessWidget {
  const HomeWeb({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Themes and Text Styles'),
        ),
        body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                // Theme.of(context) returns the current theme
                children: [
              // styles are applied based on the current theme
              Text("Heading One",
                  style: Theme.of(context).textTheme.headlineLarge),
              Text("Heading Two",
                  style: Theme.of(context).textTheme.headlineMedium),
              Text("Sample Body Text",
                  style: Theme.of(context).textTheme.bodyMedium),
            ])));
  }
}
