// main.dart
import 'package:diabetes_classifier_app/screens/prediction/prediction_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const DiabetesClassifier());
}

class DiabetesClassifier extends StatelessWidget {
  const DiabetesClassifier({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Diabetes Classifier App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.purple),
        useMaterial3: true,
      ),
      home: const PredictionScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
