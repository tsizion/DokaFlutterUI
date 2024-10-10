import 'package:doka/Widgets/HomeScreen/TabBar.dart';
import 'package:flutter/material.dart';
import 'package:doka/Widgets/HomeScreen/header.dart'; // Import Header widget
import 'package:doka/Widgets/HomeScreen/SearchBar.dart'
    as custom; // Alias the custom SearchBar

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(), // Use the Header widget as the app bar
      body: Column(
        children: [
          custom.Search(), // SearchBar widget placed below the header
          SizedBox(
            height: 3,
          ),
          TabBarWidget(), // Your new TabBar widget
        ],
      ),
    );
  }
}
