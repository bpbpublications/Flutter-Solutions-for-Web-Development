// lib/widgets/vb_form.dart
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:visionary_project/core/constants.dart';

/// A form widget for adding or editing a vision item
class AddItemForm extends StatelessWidget {
  /// The initial text for the item
  final String initialItemText;

  /// The initial URL for the image
  final String initialImageUrl;

  /// Callback function to handle form submission
  final Function(String, String) onSubmit;

  /// The global form key
  final formKey = GlobalKey<FormBuilderState>();

  /// Constructor for AddItemForm
  AddItemForm({
    super.key,
    this.initialItemText = '',
    this.initialImageUrl = '',
    required this.onSubmit,
  });

  void _saveForm() {
    if (formKey.currentState?.saveAndValidate() ?? false) {
      final itemText = formKey.currentState?.fields['itemText']?.value;
      final imageUrl = formKey.currentState?.fields['imageUrl']?.value;
      onSubmit(itemText ?? '', imageUrl ?? '');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: FormBuilder(
        key: formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            buildHeading(),
            buildFormField('itemText', Constants.itemText, Icons.text_fields),
            buildFormField('imageUrl', Constants.imageUrl, Icons.image),
            buildSaveButton(),
          ],
        ),
      ),
    );
  }

  Widget buildHeading() {
    return const Text(
      Constants.addVisionItem,
      style: TextStyle(fontSize: 24),
    );
  }

  Widget buildFormField(String name, String labelText, IconData icon) {
    return FormBuilderTextField(
      name: name,
      initialValue: name == 'itemText' ? initialItemText : initialImageUrl,
      decoration: InputDecoration(
        labelText: labelText,
        icon: Icon(icon),
      ),
      validator: FormBuilderValidators.required(),
    );
  }

  Widget buildSaveButton() {
    return Align(
      alignment: Alignment.centerRight,
      child: OutlinedButton(
        onPressed: _saveForm,
        child: const Text(Constants.saveVisionItem),
      ),
    );
  }
}
