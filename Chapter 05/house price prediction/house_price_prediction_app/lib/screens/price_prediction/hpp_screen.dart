import 'package:flutter/cupertino.dart';

import '../responsive_layout.dart';
import 'hpp_web.dart';

class HppScreen extends StatelessWidget {
  const HppScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const ResponsiveLayout(
      webLayout: HppWeb(),
      mobileLayout: Placeholder(),
      tabletLayout: Placeholder(),
    );
  }
}
