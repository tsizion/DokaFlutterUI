import 'package:doka/Model/Product/poductmodel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

final productProvider = FutureProvider<Map<String, List<Product>>>((ref) async {
  final response = await http
      .get(Uri.parse('https://dokabackend.onrender.com/api/v1/product/'));

  if (response.statusCode == 200) {
    final jsonResponse = json.decode(response.body);

    // Create a map to group products by category
    Map<String, List<Product>> categorizedProducts = {};

    // Iterate over the products and add them to the appropriate category in the map
    for (var product in jsonResponse['data']['products']) {
      Product newProduct = Product.fromJson(product);
      String category = newProduct.category;

      // Initialize the category list if it doesn't exist
      if (!categorizedProducts.containsKey(category)) {
        categorizedProducts[category] = [];
      }
      // Add the product to the category list
      categorizedProducts[category]!.add(newProduct);
    }

    return categorizedProducts;
  } else {
    throw Exception('Failed to load products');
  }
});
