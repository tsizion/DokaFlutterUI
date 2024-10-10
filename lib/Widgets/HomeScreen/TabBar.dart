import 'package:doka/Widgets/HomeScreen/ProductCard.dart';
import 'package:doka/Widgets/HomeScreen/productgrid.dart';
import 'package:doka/theme/theme.dart';
import 'package:flutter/material.dart';

class TabBarWidget extends StatefulWidget {
  @override
  _TabBarWidgetState createState() => _TabBarWidgetState();
}

class _TabBarWidgetState extends State<TabBarWidget> {
  int _selectedIndex = 0; // Track the currently selected tab

  // List of tab titles and corresponding content
  // List of tab titles and corresponding content
  final List<String> _tabTitles = [
    'All Products',
    'Makeup',
    'Skincare',
    'Haircare',
    'Fragrance'
  ];

  final List<Widget> _tabContents = [
    ProductGrid(),
    Center(child: Text('Makeup Content')),
    Center(child: Text('Skincare Content')),
    Center(child: Text('Haircare Content')),
    Center(child: Text('Fragrance Content')),
  ];
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          // Tab bar using ListView
          Container(
            padding: EdgeInsets.only(left: 15),
            height: 50, // Set a fixed height for the tab bar
            child: ListView.builder(
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
                          Container(height: 2, width: 30, color: textColorBold),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          // Content area
          Flexible(
            child: _tabContents[
                _selectedIndex], // Display content based on selected tab
          ),
        ],
      ),
    );
  }
}
