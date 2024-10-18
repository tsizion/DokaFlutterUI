import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:doka/Widgets/HomeScreen/ProductCard.dart'; // Adjust the import based on your folder structure

class ProductGrid extends StatelessWidget {
  // Method to fetch products from the API
  Future<List<Map<String, dynamic>>> fetchProducts() async {
    final response = await http
        .get(Uri.parse('https://dokabackend.onrender.com/api/v1/product/'));

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      final products = jsonResponse['data']['products'] as List;

      return products.map((product) {
        return {
          'imageUrl': product['images'][0],
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
            physics:
                const BouncingScrollPhysics(), // Optional: Add bounce effect
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
                description: products[index]['description'],
              );
            },
          );
        },
      ),
    );
  }
}
