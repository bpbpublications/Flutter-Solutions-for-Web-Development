import 'package:flower_species_clustering_app/screens/responsive_layout.dart';
import 'package:flutter/material.dart';

import 'home_web_interface.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      webLayout: HomeWebInterface(title: title),
      mobileLayout: const Placeholder(),
      tabletLayout: const Placeholder(),
    );
  }
}
