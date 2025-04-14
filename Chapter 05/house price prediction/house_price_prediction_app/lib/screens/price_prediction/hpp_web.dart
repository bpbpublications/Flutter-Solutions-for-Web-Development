// screens/price_prediction/hpp_web.dart
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_cupertino_fields/form_builder_cupertino_fields.dart';
import 'package:tflite_web/tflite_web.dart';

class HppWeb extends StatefulWidget {
  const HppWeb({super.key});

  @override
  State<HppWeb> createState() => _HppWebState();
}

class _HppWebState extends State<HppWeb> {
  TFLiteModel? tfLiteModel;
  String? housePrice;
  bool isModelLoaded = false;
  final formKey = GlobalKey<FormBuilderState>();

  @override
  void initState() {
    super.initState();
    initializeTFLite();
  }

  Future<void> initializeTFLite() async {
    try {
      await TFLiteWeb.initialize();
      tfLiteModel =
          await TFLiteModel.fromUrl('/models/house_price_model.tflite');
      setState(() => isModelLoaded = true);
    } catch (e) {
      print('Failed to initialize TFLite: $e');
    }
  }

  Future<void> predictHousePrice() async {
    if (!isModelLoaded) return;

    final houseData = formKey.currentState!.value;
    final inputs = [
      houseData['bedrooms'],
      houseData['bathrooms'],
      houseData['sqft_living'],
      houseData['floors'],
      houseData['condition'],
    ].map((e) => e as double).toList();

    final scaledInputs = minMaxScale(inputs);
    final inputTensor =
        createTensor(scaledInputs, shape: [1, 5], type: TFLiteDataType.float32);

    try {
      final prediction =
          tfLiteModel!.predict<NamedTensorMap>([inputTensor]);
      final result = extractPrediction(prediction);
      setState(
          () => housePrice = inverseLogTransform(result).toStringAsFixed(2));
    } catch (e) {
      print('Prediction failed: $e');
    }
  }

  List<double> minMaxScale(List<double> data) {
    const maxValues = [33.0, 8.0, 12050.0, 3.5, 13.0];
    const minValues = [0.0, 0.0, 290.0, 1.0, 1.0];
    return List.generate(data.length,
        (i) => (data[i] - minValues[i]) / (maxValues[i] - minValues[i]));
  }

  double extractPrediction(NamedTensorMap prediction) {
    final parts = prediction.toString().split(RegExp(r'\[\[|\],\]'));
    if (parts.length > 1) {
      return double.parse(parts[1].trim());
    }
    throw Exception('Invalid prediction format');
  }

  double inverseLogTransform(double value) => exp(value) - 1;

  void resetPrediction() => setState(() => housePrice = null);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.systemBackground,
      child: Center(
        child: SizedBox(
          width: 1200,
          child: SingleChildScrollView(
            child: Column(
              children: [
                buildHeader(),
                buildModelStatus(),
                PredictionsForm(formKey: formKey),
                const SizedBox(height: 16),
                buildButtons(),
                buildPredictionDisplay(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildHeader() {
    return const Padding(
      padding: EdgeInsets.all(16),
      child: Text(
        'Welcome to the House Price Prediction App',
        style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget buildModelStatus() {
    return isModelLoaded
        ? const Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              'Neural Network Model Loaded Successfully!',
              style:
                  TextStyle(fontSize: 16, color: CupertinoColors.systemGreen),
            ),
          )
        : const Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                CupertinoActivityIndicator(),
                SizedBox(height: 16),
                Text(
                  'Loading Model...',
                  style: TextStyle(
                      fontSize: 16, color: CupertinoColors.systemPink),
                ),
              ],
            ),
          );
  }

  Widget buildButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CupertinoButton.filled(
          onPressed: isModelLoaded
              ? () {
                  formKey.currentState!.save();
                  predictHousePrice();
                }
              : null,
          child: const Text('Predict House Price'),
        ),
        const SizedBox(width: 16),
        CupertinoButton(
          color: CupertinoColors.systemRed,
          onPressed: resetPrediction,
          child: const Text("Clear"),
        ),
      ],
    );
  }

  Widget buildPredictionDisplay() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: AnimatedCrossFade(
        duration: const Duration(milliseconds: 100),
        firstChild: const Text('Click the button to predict the house price'),
        secondChild: Column(
          children: [
            const Text('The predicted house price is'),
            const SizedBox(height: 8),
            Text(
              "\$$housePrice",
              style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: CupertinoColors.systemGreen,
              ),
            ),
          ],
        ),
        crossFadeState: housePrice == null
            ? CrossFadeState.showFirst
            : CrossFadeState.showSecond,
      ),
    );
  }
}

class PredictionsForm extends StatelessWidget {
  const PredictionsForm({super.key, required this.formKey});

  final GlobalKey<FormBuilderState> formKey;

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: formKey,
      child: Column(
        children: [
          buildSlider('bedrooms', 0, 30, 4, "bedrooms"),
          buildSlider('bathrooms', 0, 8, 3, "bathrooms"),
          buildSlider('sqft_living', 290, 12050, 5420, "sqft"),
          buildSlider('floors', 1, 5, 1, "floors", divisions: 4),
          buildSlider('condition', 1, 13, 11, "Condition: ", divisions: 12),
        ],
      ),
    );
  }

  Widget buildSlider(
      String name, double min, double max, double initialValue, String label,
      {int? divisions}) {
    return FormBuilderCupertinoSlider(
      name: name,
      min: min,
      max: max,
      initialValue: initialValue,
      divisions: divisions,
      valueWidget: (value) => Text("$value $label"),
    );
  }
}
