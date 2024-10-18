import 'package:doka/Screens/WelcomeScreen.dart';
import 'package:doka/providers/themeProvider.dart';
import 'package:doka/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart'; // Import Riverpod

void main() {
  runApp(
    ProviderScope(
      // Wrap the app with ProviderScope for Riverpod
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  // Use ConsumerWidget for accessing providers
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watch the themeProvider to get the current theme state (light/dark)
    final isDarkMode = ref.watch(themeProvider);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightTheme, // Custom light theme
      darkTheme: darkTheme, // Custom dark theme
      themeMode:
          isDarkMode ? ThemeMode.dark : ThemeMode.light, // Dynamic theme mode
      home: WelcomeScreen(), // Set WelcomeScreen as the home
    );
  }
}
