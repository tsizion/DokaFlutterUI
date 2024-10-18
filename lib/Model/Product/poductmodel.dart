class Product {
  final List<String> imageUrls; // Change this to a list
  final String title;
  final double price;
  final String category;
  final String description;

  Product({
    required this.imageUrls, // Accept a list of image URLs
    required this.title,
    required this.price,
    required this.category,
    required this.description,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    // Get all image URLs from the JSON response
    final images =
        (json['images'] as List).map((url) => url as String).toList();

    return Product(
      imageUrls: images, // Assign the list of image URLs
      title: json['name'],
      price: json['price'].toDouble(),
      category: json['category'],
      description: json['description'],
    );
  }
}
