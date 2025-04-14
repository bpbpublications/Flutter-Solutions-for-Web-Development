import 'package:flutter/material.dart';
import 'package:image_recognition_app/screens/responsive_layout.dart';

import 'image_selection_web.dart';

class ImageSelectionScreen extends StatelessWidget {
  const ImageSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const ResponsiveLayout(
        mobileLayout: Placeholder(),
        tabletLayout: Placeholder(),
        webLayout: ImageSelectionWeb());
  }
}
