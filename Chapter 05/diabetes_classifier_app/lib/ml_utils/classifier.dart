// lib/ml_utils/classifier.dart
import 'dart:convert';

import 'package:ml_algo/ml_algo.dart';
import 'package:ml_dataframe/ml_dataframe.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> saveJsonToLocalStorage(
    String key, Map<String, dynamic> jsonData) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String jsonString = jsonEncode(jsonData);
  await prefs.setString(key, jsonString);
}

Future<String?> getJsonFromLocalStorage(String key) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString(key);
}

Future<String> makePrediction(Map<String, dynamic> formData) async {
  final inputData = [
    [
      'Pregnancies',
      'Glucose',
      'BloodPressure',
      'SkinThickness',
      'Insulin',
      'BMI',
      'DiabetesPedigreeFunction',
      'Age'
    ],
    [
      double.parse(formData['Pregnancies'].toString()),
      double.parse(formData['Glucose'].toString()),
      double.parse(formData['BloodPressure'].toString()),
      double.parse(formData['SkinThickness'].toString()),
      double.parse(formData['Insulin'].toString()),
      double.parse(formData['BMI'].toString()),
      double.parse(formData['DiabetesPedigreeFunction'].toString()),
      double.parse(formData['Age'].toString()),
    ]
  ];
  final dataFrame = DataFrame(inputData);
  var modelJson = await getJsonFromLocalStorage('diabetes_model');
  if (modelJson == null) {
    return 'Model not found! Please train the model first.';
  }
  final model = KnnClassifier.fromJson(modelJson);
  final prediction = model.predict(dataFrame);
  return prediction.series.first.data.first.toString();
}

Future<Map<String, double>> trainModel() async {
  // Code to train the model
  final data = getPimaIndiansDiabetesDataFrame().shuffle();
  final splits = splitData(data, [.8]);
  final model = KnnClassifier(splits.first, 'Outcome', 5);

  var accuracy = model.assess(splits.last, MetricType.accuracy);
  var recall = model.assess(splits.last, MetricType.recall);
  var precision = model.assess(splits.last, MetricType.precision);

  await saveJsonToLocalStorage('diabetes_model', model.toJson());
  return {
    'accuracy': accuracy,
    'recall': recall,
    'precision': precision,
  };
}
