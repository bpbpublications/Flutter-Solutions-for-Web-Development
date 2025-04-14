import 'package:flutter/material.dart';

import '../responsive_layout.dart';
import 'flower_web.dart';

class FlowerScreen extends StatelessWidget {
  const FlowerScreen({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      webLayout: FlowerWeb(title: title),
      mobileLayout: const Placeholder(),
      tabletLayout: const Placeholder(),
    );
  }
}
