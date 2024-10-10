class Product {
  final String id; // Assuming you will receive an ID from the database
  final String name;
  final String description;
  final String category; // This will hold the category ID
  final double price;
  final int stock;
  final List<String> images; // List of image URLs

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.category,
    required this.price,
    required this.stock,
    required this.images,
  });

  // Factory method to create a Product from JSON
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['_id'], // Extract the ID from the JSON
      name: json['name'],
      description: json['description'],
      category: json['category'], // Category ID
      price: json['price'].toDouble(), // Ensure price is double
      stock: json['stock'],
      images:
          List<String>.from(json['images'] ?? []), // Convert the images array
    );
  }

  // Method to convert Product to JSON
  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
      'description': description,
      'category': category, // Include category ID
      'price': price,
      'stock': stock,
      'images': images,
    };
  }
}
