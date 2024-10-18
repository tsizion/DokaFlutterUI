import 'package:flutter_riverpod/flutter_riverpod.dart';

// Define a StateNotifier for managing the theme state
class ThemeNotifier extends StateNotifier<bool> {
  ThemeNotifier() : super(false); // Default theme is light mode (false)

  // Toggle the theme mode
  void toggleTheme() {
    state = !state;
  }
}

// Create a provider for the ThemeNotifier
final themeProvider = StateNotifierProvider<ThemeNotifier, bool>((ref) {
  return ThemeNotifier();
});
