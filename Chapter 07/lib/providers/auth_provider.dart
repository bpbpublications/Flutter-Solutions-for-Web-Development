// lib/providers/auth_provider.dart

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:visionary_project/notifiers/auth_notifier.dart';
import 'package:visionary_project/services/auth_service.dart';
import 'package:visionary_project/states/auth_state.dart';

/// Provides an instance of AuthService
final authServiceProvider = Provider<AuthService>((ref) {
  return AuthService();
});

/// Provides an instance of AuthNotifier
final authProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  final authService = ref.watch(authServiceProvider);
  return AuthNotifier(authService);
});
