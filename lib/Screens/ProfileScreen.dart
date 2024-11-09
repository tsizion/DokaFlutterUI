import 'package:doka/Widgets/Profile/LoginPage.dart';
import 'package:doka/Widgets/Profile/SignUp.dart';
import 'package:doka/Widgets/Profile/RegisteredProfile.dart';
import 'package:doka/providers/profilepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:doka/Widgets/Profile/LoggedInProfile.dart';

class ProfileScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watch the authPageProvider to get the current page state
    final currentPage = ref.watch(authPageProvider);

    return Scaffold(
      body: Center(
        // Determine which page to show based on the current state
        child: currentPage == AuthPage.loggedInUser
            ? LoggedInProfile() // Show LoggedInUser page when the state is loggedInUser
            : currentPage == AuthPage.login
                ? LoginPage() // Show Login page
                : currentPage == AuthPage.signUp
                    ? SignUp() // Show SignUp page
                    : Container(), // Default empty container or other fallback
      ),
    );
  }
}
