import 'package:doka/theme/theme.dart';
import 'package:flutter/material.dart';

class Search extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(left: 25, top: 8.0), // Spacing from the sides
      child: Row(
        children: [
          // Search Bar
          Expanded(
            child: Container(
              height: 40,

              padding: const EdgeInsets.symmetric(
                  horizontal: 16.0), // Padding inside the search bar
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  border:
                      Border.all(width: 0.7, color: iconColor) // Rounded edges
                  ),

              child: Row(
                children: [
                  Icon(
                    Icons.search,
                    color: Colors.grey, // Search icon color
                  ),
                  SizedBox(width: 8), // Spacing between icon and text
                  Text('Search',
                      style: Theme.of(context)
                          .textTheme
                          .displaySmall // Search text style
                      ),
                ],
              ),
            ),
          ),
          SizedBox(width: 10), // Space between the search bar and filter icon
          // Filter Icon
          IconButton(
            icon: Icon(Icons.tune), // Filter (mixer) icon
            color: Colors.pinkAccent, // Icon color
            onPressed: () {
              // Handle filter icon press
            },
          ),
        ],
      ),
    );
  }
}
