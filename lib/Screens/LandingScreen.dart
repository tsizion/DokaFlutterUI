import 'package:doka/Screens/CartScreen.dart';
import 'package:doka/Screens/HomeScreen.dart';
import 'package:doka/Screens/ProfileScreen.dart';
import 'package:doka/Screens/SearchScreen.dart';
import 'package:flutter/material.dart';
import 'package:motion_tab_bar/MotionTabBar.dart';

class LandingScreen extends StatefulWidget {
  @override
  _LandingScreenState createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  int _selectedIndex = 0;

  // List of widgets to display for each tab
  static final List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    SearchScreen(),
    CartScreen(),
    ProfileScreen(
      isRegistered: false,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // Update selected index
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;

    // Define Modern Orange Color
    final modernOrange =
        Color.fromARGB(255, 161, 82, 186); // Modern vibrant orange

    return Scaffold(
      body: _widgetOptions
          .elementAt(_selectedIndex), // Display the selected widget
      bottomNavigationBar: MotionTabBar(
        labels: ['Home', 'Search', 'Cart', 'Profile'],
        icons: [
          Icons.home,
          Icons.search,
          Icons.shopping_cart,
          Icons.person,
        ],
        initialSelectedTab: 'Home',
        onTabItemSelected: (index) {
          _onItemTapped(index); // Update selected index
        },
        textStyle: theme.textTheme.bodySmall?.copyWith(
          color: isDarkMode ? Colors.white : Colors.black,
        ),
        tabIconColor: isDarkMode
            ? Colors.grey[600]
            : modernOrange, // Tab icon color for unselected tabs
        tabIconSelectedColor: isDarkMode
            ? Colors.orangeAccent
            : modernOrange, // Tab icon color for selected tabs
        tabBarColor: isDarkMode
            ? Colors.grey[900]
            : Colors.white, // Tab bar background color
        tabSelectedColor: isDarkMode
            ? Colors.orangeAccent.withOpacity(0.3)
            : modernOrange.withOpacity(0.3), // Tab highlight color
        tabIconSize: 20,
        tabIconSelectedSize: 24,
        tabBarHeight: 50,
        tabSize: 40,
      ),
    );
  }
}
