// responsive_layout.dart
import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  // 3 Widgets for Mobile, Tablet and Web/Desktop
  final Widget mobileLayout;
  final Widget tabletLayout;
  final Widget webLayout;

  const ResponsiveLayout({
    super.key,
    required this.mobileLayout,
    required this.tabletLayout,
    required this.webLayout,
  });

  @override
  Widget build(BuildContext context) {
    // LayoutBuilder to get the constraints
    return LayoutBuilder(builder: (context, constraints) {
      // Check the maxWidth of the constraints
      if (constraints.maxWidth < 600) {
        // if less than 600, return mobileLayout
        return mobileLayout;
      } else if (constraints.maxWidth < 1200) {
        // if less than 1200, return tabletLayout
        return tabletLayout;
      } else {
        // if more than 1200, return webLayout
        return webLayout;
      }
    });
  }
}
