import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:visionary_project/core/constants.dart';
import 'package:visionary_project/firebase_options.dart';
import 'package:visionary_project/pages/auth_screen.dart';
import 'package:visionary_project/pages/board_screen.dart';

/// The main entry point of the application
Future<void> main() async {
  // Ensures that widget binding is initialized
  WidgetsFlutterBinding.ensureInitialized();
  // Initializes Firebase with the default options for the current platform
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // Runs the VisionaryApp wrapped in a ProviderScope
  runApp(ProviderScope(child: const VisionaryApp()));
}

/// The root widget of the Visionary application
class VisionaryApp extends StatelessWidget {
  const VisionaryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Constants.appTitle,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: Constants.authScreen,
      routes: {
        // Route for the authentication screen
        Constants.authScreen: (context) => const AuthScreen(),
        // Route for the board screen
        Constants.boardScreen: (context) => const BoardScreen(),
      },
      debugShowCheckedModeBanner: false,
      // Custom scroll behavior to support touch, mouse, and unknown devices
      scrollBehavior: const MaterialScrollBehavior().copyWith(dragDevices: {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
        PointerDeviceKind.unknown
      }),
    );
  }
}
