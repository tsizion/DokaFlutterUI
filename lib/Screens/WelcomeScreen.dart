import 'package:doka/Screens/LandingScreen.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  void initState() {
    super.initState();
    // Navigate to LandingScreen after 2 seconds
    Future.delayed(Duration(milliseconds: 300), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => LandingScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Doka', // Your text logo
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
    );
  }
}
