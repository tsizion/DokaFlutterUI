import 'package:flutter_riverpod/flutter_riverpod.dart';

// Enum to represent the different states (pages)
enum AuthPage { registerUser, login, signUp }

// StateNotifier to manage the authentication page state
class AuthPageNotifier extends StateNotifier<AuthPage> {
  AuthPageNotifier() : super(AuthPage.signUp); // Default to SignUp page

  // Method to change the current page
  void changePage(AuthPage page) {
    state = page;
  }
}

// Create a provider to manage the AuthPageNotifier
final authPageProvider = StateNotifierProvider<AuthPageNotifier, AuthPage>(
  (ref) => AuthPageNotifier(),
);
