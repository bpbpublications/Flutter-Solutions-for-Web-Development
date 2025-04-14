// screens/prediction/prediction_web.dart
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import '../../ml_utils/classifier.dart';

class PredictionWeb extends StatefulWidget {
  const PredictionWeb({super.key});

  @override
  State<PredictionWeb> createState() => _PredictionWebState();
}

class _PredictionWebState extends State<PredictionWeb> {
  Map<String, double> trainResult = {};
  String? prediction;
  final _formKey = GlobalKey<FormBuilderState>();

  void submitForm() {
    if (_formKey.currentState?.saveAndValidate() ?? false) {
      final formData = _formKey.currentState!.value;
      makePrediction(formData).then((value) {
        setState(() {
          prediction =
              value == '1' ? 'Diabetes detected' : 'No diabetes detected';
        });
      });
    }
  }

  void resetForm() {
    _formKey.currentState?.reset();
    setState(() => prediction = null);
  }

  Future<void> trainDiabetesModel() async {
    final result = await trainModel();
    setState(() => trainResult = result);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Diabetes Prediction Web App',
          style: TextStyle(color: Colors.white, fontSize: 30),
        ),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.purple, Colors.deepPurpleAccent],
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          buildBackground(),
          Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: DiabetesPredictionForm(
                  formKey: _formKey,
                  submitForm: submitForm,
                  resetForm: resetForm,
                ),
              ),
              Expanded(
                child: buildRightPanel(),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget buildBackground() {
    return Image.asset(
      "images/bg.png",
      fit: BoxFit.cover,
      height: double.infinity,
      width: double.infinity,
      colorBlendMode: BlendMode.modulate,
      color: Colors.purple.withOpacity(0.1),
    );
  }

  Widget buildRightPanel() {
    return FractionallySizedBox(
      heightFactor: .75,
      widthFactor: .90,
      child: Column(
        children: [
          buildTrainingSection(),
          const SizedBox(height: 20),
          buildPredictionDisplay(),
        ],
      ),
    );
  }

  Widget buildTrainingSection() {
    return Container(
      padding: const EdgeInsets.all(32.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        color: Colors.white.withAlpha(250),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          OutlinedButton.icon(
            icon: const Icon(Icons.refresh_rounded),
            onPressed: trainDiabetesModel,
            label: const Text('Train Model'),
          ),
          const Text(
            "Train the model to make predictions",
            style: TextStyle(fontSize: 10, fontWeight: FontWeight.w100),
          ),
          const SizedBox(height: 20),
          buildTrainingMetrics(),
        ],
      ),
    );
  }

  Widget buildTrainingMetrics() {
    if (trainResult.isEmpty) {
      return const Text('Train the model to get metrics');
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Accuracy: ${trainResult['accuracy']?.toStringAsFixed(2)}"),
        const SizedBox(width: 10),
        Text("Recall: ${trainResult['recall']?.toStringAsFixed(2)}"),
        const SizedBox(width: 10),
        Text("Precision: ${trainResult['precision']?.toStringAsFixed(2)}"),
      ],
    );
  }

  Widget buildPredictionDisplay() {
    return Expanded(
      child: AnimatedContainer(
        width: double.infinity,
        padding: const EdgeInsets.all(32.0),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(10),
          color: getPredictionColor(),
        ),
        duration: const Duration(seconds: 1),
        child: Center(
          child: Text(
            prediction ?? 'Prediction will appear here',
            style: const TextStyle(fontSize: 25),
          ),
        ),
      ),
    );
  }

  Color getPredictionColor() {
    if (prediction == 'Diabetes detected') {
      return Colors.red.withAlpha(200);
    } else if (prediction == 'No diabetes detected') {
      return Colors.green.withAlpha(200);
    } else {
      return Colors.grey.withAlpha(200);
    }
  }
}

class DiabetesPredictionForm extends StatelessWidget {
  final GlobalKey<FormBuilderState> formKey;
  final VoidCallback submitForm;
  final VoidCallback resetForm;

  const DiabetesPredictionForm({
    super.key,
    required this.formKey,
    required this.submitForm,
    required this.resetForm,
  });

  @override
  Widget build(BuildContext context) {
    const gapBwInput = 20.0;
    return FractionallySizedBox(
      heightFactor: .75,
      widthFactor: .90,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          color: Colors.white.withAlpha(250),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: SingleChildScrollView(
            child: FormBuilder(
              key: formKey,
              child: Column(
                children: [
                  const Text(
                    'Enter details of the patient',
                    style: TextStyle(
                      fontSize: gapBwInput,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: gapBwInput),
                  buildFormFields(),
                  const SizedBox(height: gapBwInput),
                  buildFormButtons(),
                  const SizedBox(height: gapBwInput),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildFormFields() {
    return Column(
      children: [
        buildTextField(
            'Pregnancies', 'Number of Pregnancies', Icons.numbers_outlined),
        buildTextField('Glucose', 'Oral Glucose Level (mg/dL)',
            Icons.local_hospital_outlined),
        buildTextField('BloodPressure', 'Blood Pressure (mm Hg)',
            Icons.medical_services_outlined),
        buildTextField('SkinThickness', 'Triceps Skin Thickness (mm)',
            Icons.person_outline),
        buildTextField('Insulin', 'Insulin Level (mu U/ml)',
            Icons.medical_services_outlined),
        buildTextField(
            'BMI', 'Body Mass Index (BMI)', Icons.monitor_weight_outlined),
        buildTextField(
            'DiabetesPedigreeFunction',
            'Diabetes Pedigree (History of Diabetes in Family)',
            Icons.monitor_weight_outlined,
            hintText: "Enter 0 or 1 only"),
        buildTextField('Age', 'Age of the patient', Icons.person_outline),
      ],
    );
  }

  Widget buildTextField(String name, String label, IconData icon,
      {String? hintText}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: FormBuilderTextField(
        name: name,
        decoration: InputDecoration(
          labelText: label,
          icon: Icon(icon),
          hintText: hintText,
        ),
        validator: FormBuilderValidators.compose([
          FormBuilderValidators.numeric(),
          if (name == 'DiabetesPedigreeFunction') ...[
            FormBuilderValidators.max(3),
            FormBuilderValidators.min(0),
          ],
        ]),
      ),
    );
  }

  Widget buildFormButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        OutlinedButton.icon(
          icon: const Icon(Icons.clear),
          onPressed: resetForm,
          label: const Text('Reset', style: TextStyle(fontSize: 18)),
        ),
        const SizedBox(width: 10),
        FilledButton.icon(
          icon: const Icon(Icons.check),
          onPressed: submitForm,
          label: const Text('Predict', style: TextStyle(fontSize: 18)),
        ),
      ],
    );
  }
}
