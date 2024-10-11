import 'package:doka/theme/theme.dart';
import 'package:flutter/material.dart';

class SideDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: backgroundColor2,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          // Drawer header
          Container(
            color: backgroundColor2,
            height: 70, // Set a smaller height for the header
            padding: EdgeInsets.all(16.0),
            alignment: Alignment.centerLeft,
            child: Text(
              'Menu',
              style: Theme.of(context).textTheme.displayMedium?.copyWith(
                    color: textColorBold,
                    fontSize: 20,
                  ),
            ),
          ),
          // Drawer items
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () {
              // Navigate to Home or handle tap
              Navigator.pop(context); // Close the drawer
            },
          ),
          ListTile(
            leading: Icon(Icons.account_circle),
            title: Text('Profile'),
            onTap: () {
              // Handle Profile tap
              Navigator.pop(context); // Close the drawer
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () {
              // Handle Settings tap
              Navigator.pop(context); // Close the drawer
            },
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Logout'),
            onTap: () {
              // Handle Logout tap
              Navigator.pop(context); // Close the drawer
            },
          ),
        ],
      ),
    );
  }
}
