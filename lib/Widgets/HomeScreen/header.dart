import 'package:flutter/material.dart';
import 'package:doka/theme/theme.dart';

class Header extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: Icon(
          Icons.menu,
          color: iconColor,
        ), // Hamburger menu icon
        onPressed: () {
          // Open the Drawer when the menu icon is pressed
          Scaffold.of(context).openDrawer();
        },
      ),
      title: Text('Home', style: Theme.of(context).textTheme.displayMedium),
      centerTitle: true, // Center the title
      actions: <Widget>[
        IconButton(
          icon: Icon(
            Icons.favorite_border,
            color: iconColor,
          ), // Heart icon
          onPressed: () {
            // Handle heart icon press
          },
        ),
      ],
      // Customize the background color
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
