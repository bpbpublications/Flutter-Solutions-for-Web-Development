// screens/image_selection/image_selection_web.dart
import 'package:flutter/material.dart';
import 'package:huggingface_client/huggingface_client.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_picker_for_web/image_picker_for_web.dart';

// get your Access Token from https://huggingface.co/settings/tokens
const inferenceApiKey = 'YOUR_HUGGINGFAC_AE_TOKEN';

enum RecognitionState { idle, loading, success, error }

class ImageSelectionWeb extends StatefulWidget {
  const ImageSelectionWeb({super.key});

  @override
  State<ImageSelectionWeb> createState() => _ImageSelectionWebState();
}

class _ImageSelectionWebState extends State<ImageSelectionWeb> {
  XFile? _imageFile;
  RecognitionState _recognitionState = RecognitionState.idle;
  Map<String, double> _recognitionResults = {};

  Future<void> _pickImage() async {
    final ImagePickerPlugin imagePicker = ImagePickerPlugin();
    final pickedFile =
        await imagePicker.getImageFromSource(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _imageFile = pickedFile;
        _recognitionResults.clear();
        _recognitionState = RecognitionState.idle;
      });
    }
  }

  void _resetImage() {
    setState(() {
      _imageFile = null;
      _recognitionResults.clear();
      _recognitionState = RecognitionState.idle;
    });
  }

  Future<void> _recognizeImage() async {
    if (_imageFile == null) return;

    setState(() => _recognitionState = RecognitionState.loading);

    try {
      final client = HuggingFaceClient.getInferenceClient(
          inferenceApiKey, HuggingFaceClient.inferenceBasePath);
      final apiInstance = InferenceApi(client);
      final imageFileContent = await _imageFile!.readAsBytes();

      final result = await apiInstance.queryVisionImageClassification(
        imageFile: imageFileContent,
        model: 'google/vit-base-patch16-224',
      );

      setState(() {
        _recognitionResults = {
          for (var item in result!)
            if (item != null) item.label: item.score
        };
        _recognitionState = RecognitionState.success;
      });
    } catch (e) {
      // print('Exception when calling InferenceApi->inferenceImage: $e');
      setState(() => _recognitionState = RecognitionState.error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: _imageFile == null
          ? UploadImage(onPickImage: _pickImage)
          : ImageRecognitionView(
              imageFile: _imageFile!,
              recognitionResults: _recognitionResults,
              recognitionState: _recognitionState,
              onResetImage: _resetImage,
              onRecognizeImage: _recognizeImage,
            ),
    )));
  }
}

class UploadImage extends StatelessWidget {
  final VoidCallback onPickImage;

  const UploadImage({super.key, required this.onPickImage});

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisSize: MainAxisSize.min, children: [
      const Text('Image Recognition App',
          style: TextStyle(
              fontSize: 50,
              fontWeight: FontWeight.bold,
              color: Colors.yellow,
              shadows: [
                BoxShadow(spreadRadius: 3, color: Colors.black, blurRadius: 2)
              ])),
      const SizedBox(height: 16),
      FilledButton.icon(
          style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all(Colors.orange),
              foregroundColor: WidgetStateProperty.all(Colors.white),
              padding: WidgetStateProperty.all(
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0)),
              textStyle: WidgetStateProperty.all(const TextStyle(
                  fontSize: 16.0, fontWeight: FontWeight.bold))),
          icon: const Icon(Icons.upload),
          onPressed: onPickImage,
          label: const Text('Select Image'))
    ]);
  }
}

class ImageRecognitionView extends StatelessWidget {
  final XFile imageFile;
  final Map<String, double> recognitionResults;
  final RecognitionState recognitionState;
  final VoidCallback onResetImage, onRecognizeImage;

  const ImageRecognitionView({
    super.key,
    required this.imageFile,
    required this.recognitionResults,
    required this.recognitionState,
    required this.onResetImage,
    required this.onRecognizeImage,
  });

  @override
  Widget build(BuildContext context) {
    return Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Expanded(
          child: Column(children: [
        Stack(children: [
          Container(
            width: 512,
            height: 512,
            decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(spreadRadius: 1, color: Colors.black, blurRadius: 2)
                ],
                borderRadius: BorderRadius.circular(8.0)),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(imageFile.path, fit: BoxFit.cover)),
          ),
          Positioned(
              top: 5,
              right: 5,
              child: IconButton(
                icon: const Icon(Icons.clear),
                onPressed: onResetImage,
                color: Colors.red,
              ))
        ]),
        const SizedBox(height: 16.0),
        Text("Image selected: ${imageFile.name}"),
        const SizedBox(height: 16.0),
        FilledButton.icon(
            onPressed: onRecognizeImage,
            icon: const Icon(Icons.image_search),
            label: const Text("Recognize Contents"))
      ])),
      const SizedBox(width: 16.0),
      Expanded(
        child: _buildRecognitionResults(),
      )
    ]);
  }

  Widget _buildRecognitionResults() {
    switch (recognitionState) {
      case RecognitionState.loading:
        return const Center(child: CircularProgressIndicator());
      case RecognitionState.success:
        return Column(
          children: recognitionResults.entries
              .map((entry) => ListTile(
                  title: Text(entry.key,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16.0)),
                  subtitle:
                      Text('Score: ${(entry.value * 100).toStringAsFixed(2)}%'),
                  leading: Icon(
                      entry.value > .7 ? Icons.image_outlined : Icons.image)))
              .toList(),
        );
      case RecognitionState.error:
        return const Text('Error recognizing image');
      default:
        return const SizedBox.shrink();
    }
  }
}
