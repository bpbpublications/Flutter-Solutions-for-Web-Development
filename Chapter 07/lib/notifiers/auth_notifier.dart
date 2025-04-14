// lib/notifiers/auth_notifier.dart

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:visionary_project/services/auth_service.dart';
import 'package:visionary_project/states/auth_state.dart';

/// Manages the authentication state and provides methods to update it
class AuthNotifier extends StateNotifier<AuthState> {
  final AuthService _firebaseService;

  AuthNotifier(this._firebaseService) : super(AuthState(isLoggedIn: false));

  /// Checks the login status and updates the state
  Future<void> checkLoginStatus() async =>
      state = AuthState(isLoggedIn: await _firebaseService.isLoggedIn());

  /// Signs in the user using Google authentication and updates the state
  Future<void> signIn() async =>
      state = await _firebaseService.signInWithGoogle();

  /// Signs out the user and updates the state
  Future<void> signOut() async => state = await _firebaseService.signOut();
}
