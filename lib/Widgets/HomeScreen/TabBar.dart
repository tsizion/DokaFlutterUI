import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:doka/Widgets/HomeScreen/ProductCard.dart';
import 'package:doka/Widgets/HomeScreen/productgrid.dart';
import 'package:doka/theme/theme.dart';

class TabBarWidget extends StatefulWidget {
  @override
  _TabBarWidgetState createState() => _TabBarWidgetState();
}

class _TabBarWidgetState extends State<TabBarWidget> {
  int _selectedIndex = 0; // Track the currently selected tab
  List<String> _tabTitles = []; // List to hold category names
  bool _isLoading = true; // Loading state

  @override
  void initState() {
    super.initState();
    fetchCategories(); // Fetch categories when the widget is initialized
  }

  Future<void> fetchCategories() async {
    final response = await http
        .get(Uri.parse('https://dokabackend.onrender.com/api/v1/category/'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List<dynamic> categories = data['data']['categories'];

      // Get the first 10 category names and prepend "All Categories"
      setState(() {
        _tabTitles = ['All Categories'] +
            categories
                .map((category) => category['name'] as String)
                .take(10)
                .toList();
        _isLoading = false; // Set loading to false after fetching
      });
    } else {
      throw Exception('Failed to load categories');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          // Tab bar using ListView
          Container(
            padding: EdgeInsets.only(left: 15),
            height: 50, // Set a fixed height for the tab bar
            child: _isLoading
                ? Center(
                    child:
                        CircularProgressIndicator()) // Show loading indicator while fetching
                : ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: _tabTitles.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedIndex = index; // Update the selected index
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 8), // Reduced horizontal padding
                          alignment: Alignment.center,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // Container to add spacing around the tab title
                              Container(
                                margin: EdgeInsets.symmetric(
                                    horizontal: 10), // Adjust spacing here
                                child: Text(
                                  _tabTitles[index],
                                  style: _selectedIndex == index
                                      ? Theme.of(context)
                                          .textTheme
                                          .displaySmall!
                                          .copyWith(
                                              fontWeight: FontWeight
                                                  .bold, // Bold for selected tab
                                              color: textColorBold)
                                      : Theme.of(context)
                                          .textTheme
                                          .displaySmall!
                                          .copyWith(
                                              color:
                                                  textColor), // Default style for unselected tabs
                                ),
                              ),
                              // Underline effect for the active tab
                              if (_selectedIndex == index)
                                Container(
                                    height: 2, width: 30, color: textColorBold),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
          ),
          // Content area
          Flexible(
            child: _selectedIndex < _tabTitles.length
                ? ProductGrid() // Display the ProductGrid based on selected tab
                : Center(child: Text('No Content Available')),
          ),
        ],
      ),
    );
  }
}
