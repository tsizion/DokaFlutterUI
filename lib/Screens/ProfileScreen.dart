import 'package:doka/Widgets/Profile/LoginPage.dart';
import 'package:doka/Widgets/Profile/SignUp.dart';
import 'package:doka/Widgets/Profile/RegisteredProfile.dart';
import 'package:doka/providers/profilepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfileScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watch the authPageProvider to get the current page state
    final currentPage = ref.watch(authPageProvider);

    return Scaffold(
      body: Center(
        // Determine which page to show based on the current state
        child: currentPage == AuthPage.registerUser
            ? LoggedInUser()
            : currentPage == AuthPage.login
                ? LoginPage() // Show Login page
                : SignUp(), // Default to SignUp page
      ),
    );
  }
}
