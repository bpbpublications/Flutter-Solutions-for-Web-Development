import 'package:diabetes_classifier_app/screens/prediction/prediction_web.dart';
import 'package:diabetes_classifier_app/screens/responsive_layout.dart';
import 'package:flutter/material.dart';

class PredictionScreen extends StatelessWidget {
  const PredictionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const ResponsiveLayout(
      mobileLayout: Placeholder(),
      tabletLayout: Placeholder(),
      webLayout: PredictionWeb(),
    );
  }
}
