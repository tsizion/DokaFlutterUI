import 'package:doka/Widgets/HomeScreen/ProductCard.dart';
import 'package:flutter/material.dart';

class ProductGrid extends StatelessWidget {
  // Mock list of products
  final List<Map<String, dynamic>> products = [
    {
      'imageUrl':
          'https://images.pexels.com/photos/4202325/pexels-photo-4202325.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
      'title': 'Product 1',
      'price': 29.99,
      'category': 'Category A',
      'description':
          'This is a great product for your needs.', // Add description
    },
    {
      'imageUrl':
          'https://images.pexels.com/photos/2720447/pexels-photo-2720447.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
      'title': 'Product 2',
      'price': 19.99,
      'category': 'Category B',
      'description':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non', // Add description
    },
    {
      'imageUrl':
          'https://images.pexels.com/photos/12344805/pexels-photo-12344805.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
      'title': 'Product 3',
      'price': 39.99,
      'category': 'Category A',
      'description': 'Popular among our customers.', // Add description
    },
    {
      'imageUrl':
          'https://images.pexels.com/photos/25466531/pexels-photo-25466531/free-photo-of-three-bottles-of-gel.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
      'title': 'Product 4',
      'price': 49.99,
      'category': 'Category C',
      'description': 'A must-have item for your collection.', // Add description
    },
    {
      'imageUrl':
          'https://images.pexels.com/photos/212236/pexels-photo-212236.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
      'title': 'Product 5',
      'price': 60.99,
      'category': 'Category C',
      'description': 'A must-have item for your collection.', // Add description
    },
    {
      'imageUrl':
          'https://images.pexels.com/photos/2688991/pexels-photo-2688991.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
      'title': 'Product 6',
      'price': 149.99,
      'category': 'Category C',
      'description': 'A must-have item for your collection.', // Add description
    },
    {
      'imageUrl':
          'https://images.pexels.com/photos/25466531/pexels-photo-25466531/free-photo-of-three-bottles-of-gel.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
      'title': 'Product 4',
      'price': 49.99,
      'category': 'Category C',
      'description': 'A must-have item for your collection.', // Add description
    },
    {
      'imageUrl':
          'https://images.pexels.com/photos/7795791/pexels-photo-7795791.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
      'title': 'Product 4',
      'price': 49.99,
      'category': 'Category C',
      'description': 'A must-have item for your collection.', // Add description
    },
    {
      'imageUrl':
          'https://images.pexels.com/photos/8490173/pexels-photo-8490173.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
      'title': 'Product 4',
      'price': 49.99,
      'category': 'Category C',
      'description': 'A must-have item for your collection.', // Add description
    },
    // Add more products as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
        physics: const BouncingScrollPhysics(), // Optional: Add bounce effect
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Two columns
          childAspectRatio:
              0.8, // Aspect ratio for each card (adjust as needed)
          crossAxisSpacing: 10, // Space between columns
          mainAxisSpacing: 10, // Space between rows
        ),
        itemCount: products.length,
        itemBuilder: (context, index) {
          return ProductCard(
            imageUrl: products[index]['imageUrl'],
            title: products[index]['title'],
            price: products[index]['price'],
            category: products[index]['category'],
            description: products[index]['description'], // Pass description
          );
        },
      ),
    );
  }
}
