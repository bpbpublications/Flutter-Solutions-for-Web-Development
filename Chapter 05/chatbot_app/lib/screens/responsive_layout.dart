import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget mobileLayout;
  final Widget tabletLayout;
  final Widget webLayout;

  const ResponsiveLayout(
      {super.key,
      required this.mobileLayout,
      required this.tabletLayout,
      required this.webLayout});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth < 600) {
          return mobileLayout;
        } else if (constraints.maxWidth < 1200) {
          return tabletLayout;
        } else {
          return webLayout;
        }
      },
    );
  }
}
