import 'package:flutter/cupertino.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget mobileLayout;
  final Widget webLayout;
  final Widget tabletLayout;

  const ResponsiveLayout({
    super.key,
    required this.mobileLayout,
    required this.webLayout,
    required this.tabletLayout,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth < 600) {
        return mobileLayout;
      } else if (constraints.maxWidth < 1200) {
        return tabletLayout;
      } else {
        return webLayout;
      }
    });
  }
}
