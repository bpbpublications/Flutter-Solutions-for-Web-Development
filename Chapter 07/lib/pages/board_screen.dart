// lib/pages/board_screen.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:visionary_project/core/constants.dart';
import 'package:visionary_project/notifiers/vision_notifier.dart';
import 'package:visionary_project/providers/auth_provider.dart';
import 'package:visionary_project/providers/vision_provider.dart';
import 'package:visionary_project/widgets/vb_form.dart';
import 'package:visionary_project/widgets/vb_grid.dart';
import 'package:visionary_project/widgets/vb_image.dart';
import 'package:visionary_project/widgets/vb_sidebar.dart';

class BoardScreen extends ConsumerStatefulWidget {
  const BoardScreen({super.key});

  @override
  BoardScreenState createState() => BoardScreenState();
}

class BoardScreenState extends ConsumerState<BoardScreen> {
  Future<dynamic> buildAddForm(
    BuildContext context,
    VisionItemsNotifier visionItemsNotifier,
  ) {
    return showFormSheet(context, visionItemsNotifier);
  }

  Future<dynamic> showFormSheet(
      BuildContext context, VisionItemsNotifier visionItemsNotifier) {
    return showModalBottomSheet(
      context: context,
      builder: (context) => AddItemForm(
        onSubmit: (itemText, imageUrl) async {
          Navigator.pop(context);
          await visionItemsNotifier.addOrUpdateItem(itemText, imageUrl, null);
        },
      ),
    );
  }

  void handleSignOut(BuildContext context) {
    ref.read(authProvider.notifier).signOut();
    Navigator.pushReplacementNamed(context, Constants.authScreen);
  }

  @override
  Widget build(BuildContext context) {
    final visionItemsNotifier = ref.read(visionItemsNotifierProvider.notifier);
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth > 600) {
        return LandscapeScaffold(
          visionItemsNotifier: visionItemsNotifier,
          buildAddForm: buildAddForm,
          handleSignOut: handleSignOut,
        );
      } else {
        return PortraitScaffold(
          visionItemsNotifier: visionItemsNotifier,
          buildAddForm: buildAddForm,
          handleSignOut: handleSignOut,
        );
      }
    });
  }
}

class LandscapeScaffold extends StatelessWidget {
  final VisionItemsNotifier visionItemsNotifier;
  final Future<dynamic> Function(BuildContext, VisionItemsNotifier)
      buildAddForm;
  final void Function(BuildContext) handleSignOut;

  const LandscapeScaffold({
    super.key,
    required this.visionItemsNotifier,
    required this.buildAddForm,
    required this.handleSignOut,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const BackgroundImage(),
          Row(
            children: [
              VisionDrawer(
                color: Colors.white.withOpacity(0.9),
                signOut: () => handleSignOut(context),
                addItem: () => buildAddForm(context, visionItemsNotifier),
              ),
              const Expanded(child: VisionGrid())
            ],
          ),
        ],
      ),
    );
  }
}

class PortraitScaffold extends StatelessWidget {
  final VisionItemsNotifier visionItemsNotifier;
  final Future<dynamic> Function(BuildContext, VisionItemsNotifier)
      buildAddForm;
  final void Function(BuildContext) handleSignOut;

  const PortraitScaffold({
    super.key,
    required this.visionItemsNotifier,
    required this.buildAddForm,
    required this.handleSignOut,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("V I S I O N A R Y")),
      drawer: VisionDrawer(
        color: Colors.white.withOpacity(0.9),
        signOut: () => handleSignOut(context),
        addItem: () {
          Navigator.pop(context);
          buildAddForm(context, visionItemsNotifier);
        },
      ),
      body: Stack(
        children: [
          const BackgroundImage(),
          const VisionGrid(),
        ],
      ),
    );
  }
}
