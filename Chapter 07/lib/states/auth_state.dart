// lib/states/auth_state.dart

/// Represents the authentication state
class AuthState {
  final String? errorMessage;
  final bool isLoggedIn;

  AuthState({this.errorMessage, this.isLoggedIn = false});
}
