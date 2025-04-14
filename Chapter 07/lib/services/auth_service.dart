// lib/services/auth_service.dart
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:visionary_project/states/auth_state.dart';

/// Service class for handling authentication
class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  /// Checks if the user is logged in
  Future<bool> isLoggedIn() async {
    return _auth.currentUser != null;
  }

  /// Signs in the user with Google authentication
  Future<AuthState> signInWithGoogle() async {
    try {
      // Create a Google auth provider
      GoogleAuthProvider googleProvider = GoogleAuthProvider();
      // show the Google sign-in dialog
      var userCredentials = await _auth.signInWithPopup(googleProvider);
      // If the user is not null, the sign-in was successful
      if (userCredentials.user != null) {
        // update the state to reflect the user's login status
        return AuthState(
          isLoggedIn: true,
        );
      } else {
        return AuthState(errorMessage: 'Sign in failed');
      }
    } on FirebaseAuthException catch (e) {
      debugPrint("FirebaseAuthException: ${e.message}");
      return AuthState(
        errorMessage: "Sign in failed: ${e.message}",
      );
    } catch (e) {
      debugPrint("Unknown error: $e");
      return AuthState(errorMessage: "Unknown error: $e");
    }
  }

  /// Signs out the current user
  Future<AuthState> signOut() async {
    try {
      await _auth.signOut();
      return AuthState(isLoggedIn: false);
    } catch (e) {
      debugPrint("Error signing out: $e");
      return AuthState(
        isLoggedIn: true,
        errorMessage: "Sign out failed: $e",
      );
    }
  }
}
