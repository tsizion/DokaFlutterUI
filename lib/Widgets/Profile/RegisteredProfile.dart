import 'package:flutter/material.dart';

class RegisteredProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Top row with username and support icon
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Username on the left
              Text(
                'Username',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              // Support icon on the right
              IconButton(
                icon: Icon(Icons.support_agent, color: Colors.blue, size: 30),
                onPressed: () {
                  // Handle support button click
                },
              ),
            ],
          ),
          SizedBox(height: 20), // Spacing between the top and the list items

          // Account Details
          _buildListTile(Icons.person, 'Account Details'),
          _buildListTile(Icons.location_on, 'Location'),
          _buildListTile(Icons.attach_money, 'Currency'),
          _buildListTile(Icons.language, 'Language'),
          SizedBox(height: 20), // Spacing between sections

          // My Orders
          Text(
            'My Orders',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10), // Spacing between section title and items
          _buildListTile(Icons.payment, 'Unpaid'),
          _buildListTile(Icons.timer, 'Processing'),
          _buildListTile(Icons.local_shipping, 'Shipped'),
        ],
      ),
    );
  }

  // Helper method to build each list item
  Widget _buildListTile(IconData icon, String title) {
    return ListTile(
      leading: Icon(icon, color: Colors.blue),
      title: Text(
        title,
        style: TextStyle(fontSize: 18),
      ),
      trailing: Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
      onTap: () {
        // Handle list item click
      },
    );
  }
}
