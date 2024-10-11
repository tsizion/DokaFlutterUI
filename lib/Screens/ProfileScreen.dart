import 'package:doka/Widgets/Profile/NonRegisteredProfile.dart';
import 'package:doka/Widgets/Profile/RegisteredProfile.dart';
import 'package:doka/theme/styles.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  final bool isRegistered;

  ProfileScreen({required this.isRegistered});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profile',
          style: bodyMediumStyle,
        ),
        centerTitle: true,
      ),
      body: Center(
        child: isRegistered ? RegisteredProfile() : NonRegisteredProfile(),
      ),
    );
  }
}
