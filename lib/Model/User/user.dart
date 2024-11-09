class User {
  final String id;
  final String username;
  final String phoneNumber;
  final List<String> address;
  final String status;

  User({
    required this.id,
    required this.username,
    required this.phoneNumber,
    required this.address,
    required this.status,
  });

  // A method to parse JSON data into a User model
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['_id'],
      username: json['username'],
      phoneNumber: json['phoneNumber'],
      address: List<String>.from(json['address']),
      status: json['status'],
    );
  }

  // Convert a User object to JSON for storage
  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'username': username,
      'phoneNumber': phoneNumber,
      'address': address,
      'status': status,
    };
  }
}
