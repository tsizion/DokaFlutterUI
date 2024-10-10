class Category {
  final String id; // Assuming you will receive an ID from the database
  final String name;

  Category({
    required this.id,
    required this.name,
  });

  // Factory method to create a Category from JSON
  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['_id'], // Extract the ID from the JSON
      name: json['name'],
    );
  }

  // Method to convert Category to JSON
  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
    };
  }
}
