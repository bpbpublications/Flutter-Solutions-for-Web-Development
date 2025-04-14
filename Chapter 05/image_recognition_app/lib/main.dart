import 'package:flutter/material.dart';

import 'screens/image_selection/image_selection_screen.dart';

void main() {
  runApp(const ImageRecognitionApp());
}

class ImageRecognitionApp extends StatelessWidget {
  const ImageRecognitionApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Image Recognition App',
        theme: ThemeData(
            colorScheme: ColorScheme.fromSwatch(
          brightness: Brightness.light,
        )),
        darkTheme: ThemeData(
            colorScheme: ColorScheme.fromSwatch(
          brightness: Brightness.dark,
        )),
        home: const ImageSelectionScreen(),
        debugShowCheckedModeBanner: false);
  }
}
