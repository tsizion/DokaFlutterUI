import 'package:doka/Model/Product/poductmodel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:collection/collection.dart'; // Import the collection package

final categorizedProductProvider =
    FutureProvider<Map<String, List<Product>>>((ref) async {
  final response = await http
      .get(Uri.parse('https://dokabackend.onrender.com/api/v1/product/'));

  if (response.statusCode == 200) {
    final jsonResponse = json.decode(response.body);
    final products = (jsonResponse['data']['products'] as List)
        .map((product) => Product.fromJson(product))
        .toList();

    // Group products by category
    final categorizedProducts =
        groupBy(products, (Product product) => product.category);

    return categorizedProducts; // Returns a map with category as the key and list of products as the value
  } else {
    throw Exception('Failed to load products');
  }
});
