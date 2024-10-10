import 'package:doka/theme/theme.dart';
import 'package:flutter/material.dart';

class CartItem {
  final String name;
  final String category;
  final String imageUrl;
  final double price;
  int quantity;

  CartItem({
    required this.name,
    required this.category,
    required this.imageUrl,
    required this.price,
    required this.quantity,
  });
}

class CartScreen extends StatelessWidget {
  // Sample cart items
  final List<CartItem> cartItems = [
    CartItem(
      name: 'Lipstick',
      category: 'Makeup',
      imageUrl:
          'https://images.pexels.com/photos/234220/pexels-photo-234220.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
      price: 12.99,
      quantity: 2,
    ),
    CartItem(
      name: 'Foundation',
      category: 'Makeup',
      imageUrl:
          'https://images.pexels.com/photos/2661256/pexels-photo-2661256.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
      price: 29.99,
      quantity: 1,
    ),
    CartItem(
      name: 'Eyeliner',
      category: 'Makeup',
      imageUrl:
          'https://images.pexels.com/photos/12344805/pexels-photo-12344805.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
      price: 8.50,
      quantity: 1,
    ),
    CartItem(
      name: 'Eyeliner',
      category: 'Makeup',
      imageUrl:
          'https://images.pexels.com/photos/12344805/pexels-photo-12344805.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
      price: 8.50,
      quantity: 1,
    ),
    CartItem(
      name: 'Eyeliner',
      category: 'Makeup',
      imageUrl:
          'https://images.pexels.com/photos/12344805/pexels-photo-12344805.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
      price: 8.50,
      quantity: 1,
    ),
    CartItem(
      name: 'Eyeliner',
      category: 'Makeup',
      imageUrl:
          'https://images.pexels.com/photos/12344805/pexels-photo-12344805.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
      price: 8.50,
      quantity: 1,
    ),
    CartItem(
      name: 'Eyeliner',
      category: 'Makeup',
      imageUrl:
          'https://images.pexels.com/photos/12344805/pexels-photo-12344805.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
      price: 8.50,
      quantity: 1,
    ),
    CartItem(
      name: 'Eyeliner',
      category: 'Makeup',
      imageUrl:
          'https://images.pexels.com/photos/12344805/pexels-photo-12344805.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
      price: 8.50,
      quantity: 1,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    double totalAmount =
        cartItems.fold(0, (sum, item) => sum + (item.price * item.quantity));

    return Scaffold(
      backgroundColor: backgroundColor2,
      appBar: AppBar(
        backgroundColor: backgroundColor2,
        title: Text(
          'Cart',
          style: Theme.of(context).textTheme.displayMedium,
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 6),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                "My Cart",
                style: Theme.of(context)
                    .textTheme
                    .displayMedium
                    ?.copyWith(color: iconColor, fontWeight: FontWeight.bold),
                textAlign: TextAlign.left,
              ),
            ),
          ),
          // Expanded widget to make the cart items scrollable
          Expanded(
            child: ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                final item = cartItems[index];
                return Card(
                  shadowColor: Colors.white,
                  color: backgroundColor,
                  margin:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        // Product Image
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            item.imageUrl,
                            width: 80,
                            height: 80,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(width: 16),
                        // Product Details
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(item.name,
                                  style: Theme.of(context)
                                      .textTheme
                                      .displaySmall
                                      ?.copyWith(fontWeight: FontWeight.bold)),
                              const SizedBox(height: 4),
                              Text(item.category,
                                  style: Theme.of(context).textTheme.bodySmall),
                              const SizedBox(height: 10),
                              Text('\$${item.price.toStringAsFixed(2)}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .displaySmall
                                      ?.copyWith(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                          letterSpacing: 2)),
                            ],
                          ),
                        ),
                        // Quantity Counter
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8.0, vertical: 5),
                              decoration: BoxDecoration(
                                color:
                                    backgroundColor2, // Background color for the counter
                                borderRadius: BorderRadius.circular(19),
                              ),
                              child: Row(
                                children: [
                                  // Minus Button
                                  Container(
                                    height: 30,
                                    width: 30,
                                    decoration: BoxDecoration(
                                      color: Colors
                                          .white, // White background for the button
                                      shape: BoxShape.circle, // Circular shape
                                    ),
                                    child: IconButton(
                                      icon: const Icon(Icons.remove,
                                          size: 17,
                                          color: Color.fromARGB(255, 100, 100,
                                              100)), // Darker color for -
                                      padding:
                                          EdgeInsets.zero, // Remove padding
                                      onPressed: () {
                                        // Handle decrement action
                                      },
                                    ),
                                  ),
                                  const SizedBox(
                                      width:
                                          8), // Spacing between buttons and quantity text
                                  Text(
                                    '${item.quantity}',
                                    style: TextStyle(fontSize: 18),
                                  ),
                                  const SizedBox(
                                      width:
                                          8), // Spacing between quantity text and plus button
                                  // Plus Button
                                  Container(
                                    height: 30,
                                    width: 30,
                                    decoration: BoxDecoration(
                                      color: Colors
                                          .white, // White background for the button
                                      shape: BoxShape.circle, // Circular shape
                                    ),
                                    child: IconButton(
                                      icon: const Icon(Icons.add,
                                          size: 17,
                                          color: Color.fromARGB(255, 100, 100,
                                              100)), // Darker color for +
                                      padding:
                                          EdgeInsets.zero, // Remove padding
                                      onPressed: () {
                                        // Handle increment action
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          // Fixed bottom container for total price and checkout button
          Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    blurRadius: 5,
                    spreadRadius: 1),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Total: \$${totalAmount.toStringAsFixed(2)}',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    // Handle checkout action
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: textColorBold,
                    minimumSize: Size(double.infinity, 50), // Full width
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child:
                      Text('Checkout', style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
