// screens/home/home_screen.dart
import 'package:flutter/material.dart';

import '../responsive_layout.dart';
import 'HomeMobile.dart';
import 'home_tablet.dart';
import 'home_web.dart';

// starting point of the Home Screen
class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // ResponsiveLayout returns a Widget based on the screen size
    return const ResponsiveLayout(
      mobileLayout: HomeMobile(),
      tabletLayout: HomeTablet(),
      webLayout: HomeWeb(),
    );
  }
}
