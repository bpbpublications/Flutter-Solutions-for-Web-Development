import 'dart:ui';

import 'package:flutter/cupertino.dart';

import 'screens/price_prediction/hpp_screen.dart';

void main() {
  runApp(const HousePricePredictionApp());
}

class HousePricePredictionApp extends StatelessWidget {
  const HousePricePredictionApp({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: 'House Price Prediction App',
      home: const HppScreen(),
      debugShowCheckedModeBanner: false,
      theme: const CupertinoThemeData(
        brightness: Brightness.light,
        primaryColor: CupertinoColors.systemBlue,
      ),
      scrollBehavior: const CupertinoScrollBehavior().copyWith(
        dragDevices: {
          PointerDeviceKind.unknown,
          PointerDeviceKind.touch,
          PointerDeviceKind.mouse,
        },
      ),
    );
  }
}
