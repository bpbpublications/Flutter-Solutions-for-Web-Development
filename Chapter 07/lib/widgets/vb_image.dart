// lib/widgets/background_image.dart

import 'package:flutter/material.dart';

class BackgroundImage extends StatelessWidget {
  final String localPath;

  const BackgroundImage({
    super.key,
    this.localPath = 'assets/images/bg.jpg', // default image
  });

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Image.asset(
        localPath,
        fit: BoxFit.cover,
        repeat: ImageRepeat.repeat,
        width: double.infinity,
        height: double.infinity,
      ),
    );
  }
}
