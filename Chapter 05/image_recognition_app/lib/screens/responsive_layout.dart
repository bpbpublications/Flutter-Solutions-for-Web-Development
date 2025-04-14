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
    return LayoutBuilder(builder: (context, constraing) {
      if (constraing.maxWidth < 600) {
        return mobileLayout;
      } else if (constraing.maxWidth < 1200) {
        return tabletLayout;
      } else {
        return webLayout;
      }
    });
  }
}
