// lib/pages/auth_screen.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:visionary_project/core/constants.dart';
import 'package:visionary_project/providers/auth_provider.dart';
import 'package:visionary_project/states/auth_state.dart';
import 'package:visionary_project/widgets/vb_image.dart';

/// A screen that handles user authentication
class AuthScreen extends ConsumerStatefulWidget {
  const AuthScreen({super.key});

  @override
  ConsumerState<AuthScreen> createState() => _AuthScreenState();
}

/// State class for AuthScreen
class _AuthScreenState extends ConsumerState<AuthScreen> {
  /// initState() is called after the widget is built for the first time
  @override
  void initState() {
    super.initState();
    // this callback is called after the frame is displayed
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // read the authProvider.notifier and call the checkLoginStatus() method
      ref.read(authProvider.notifier).checkLoginStatus();
    });
  }

  /// Handles the sign-in button press event
  void onSignInPressed() {
    ref.read(authProvider.notifier).signIn();
  }

  /// Builds the center content of the screen
  Widget buildAuthCenter(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            Constants.appTitle,
            style: TextStyle(
              fontSize: 77,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton.icon(
            // Call the onSignInPressed method
            onPressed: onSignInPressed,
            icon: const Icon(FontAwesomeIcons.google),
            label: const Text(Constants.googleSignInButtonText),
            style: ButtonStyle(
              // Set the fixed size of the button
              fixedSize: WidgetStateProperty.all(const Size(350, 60)),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Task 1: listen to the AuthState changes
    ref.listen<AuthState>(authProvider, (previous, next) {
      if (next.isLoggedIn) {
        // replace the current screen with the VisionBoardScreen
        Navigator.pushReplacementNamed(context, Constants.boardScreen);
      } else if (next.errorMessage != null) {
        // show a snackbar with the error message
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(next.errorMessage ?? 'An error occurred'),
            duration: const Duration(seconds: 5),
          ),
        );
      }
    });
    // Task 2: set the page layout
    return Scaffold(
        body: Stack(
      children: [
        BackgroundImage(), // the background image
        buildAuthCenter(context), // the center content
      ],
    ));
  }
}
