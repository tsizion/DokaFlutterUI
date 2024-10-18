import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:doka/Widgets/HomeScreen/ProductCard.dart'; // Adjust the import based on your folder structure

class ProductGrid extends StatelessWidget {
  final String category; // New parameter for the selected category

  const ProductGrid({Key? key, required this.category}) : super(key: key);

  // Method to fetch products from the API
  Future<List<Map<String, dynamic>>> fetchProducts() async {
    final response = await http.get(
      Uri.parse('https://dokabackend.onrender.com/api/v1/product/'),
    );

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      final products = jsonResponse['data']['products'] as List;

      // Return filtered products if a category is selected
      if (category != 'All Categories') {
        return products.where((product) {
          return product['category'] == category; // Filter by category
        }).map((product) {
          return {
            'imageUrl': (product['images'] as List).first as String,
            'imageUrls': List<String>.from(product['images']),
            'title': product['name'],
            'price': product['price'],
            'category': product['category'],
            'description': product['description'],
          };
        }).toList();
      }

      // Return all products if 'All Categories' is selected
      return products.map((product) {
        return {
          'imageUrl': (product['images'] as List).first as String,
          'imageUrls': List<String>.from(product['images']),
          'title': product['name'],
          'price': product['price'],
          'category': product['category'],
          'description': product['description'],
        };
      }).toList();
    } else {
      throw Exception('Failed to load products');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: FutureBuilder<List<Map<String, dynamic>>>(
        future: fetchProducts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No products available.'));
          }

          final products = snapshot.data!;

          return GridView.builder(
            physics: const BouncingScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.8,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemCount: products.length,
            itemBuilder: (context, index) {
              final product = products[index];
              return ProductCard(
                imageUrl: product['imageUrls'][0], // First image for the card
                title: product['title'],
                price: product['price'],
                category: product['category'],
                description: product['description'],
                imageUrls:
                    product['imageUrls'], // Pass all images for detail page
              );
            },
          );
        },
      ),
    );
  }
}
