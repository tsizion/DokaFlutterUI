import 'package:doka/Screens/ProductDetail.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatefulWidget {
  final List<String> imageUrls; // New parameter to pass all images

  final String imageUrl;
  final String title;
  final double price;
  final String category; // New parameter for product category
  final String description; // New parameter for product description

  const ProductCard({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.price,
    required this.category, // Add category parameter
    required this.description, // Add description parameter
    required this.imageUrls, // Include the new parameter
  }) : super(key: key);

  @override
  _ProductCardState createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  bool isFavorite = false; // State to track favorite status

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to ProductDetail and pass product info
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ProductDetail(
              category: widget.category,
              productName: widget.title,
              imageUrls: widget.imageUrls,

              // List of image URLs (you can modify this)
              description: widget.description,
              price: widget.price,
            ),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.all(10), // Add margin around the card
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 255, 255, 255),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 5, color: Colors.white),
          boxShadow: [
            BoxShadow(
              color: const Color.fromARGB(255, 213, 213, 213).withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3), // Changes position of shadow
            ),
          ],
        ),
        width: 150, // Fixed width for the card
        child: Stack(
          children: [
            // Product image
            ClipRRect(
              borderRadius: const BorderRadius.vertical(
                  bottom: Radius.circular(10),
                  top: Radius.circular(10)), // Rounded top corners
              child: Image.network(
                widget.imageUrl,
                fit: BoxFit.cover, // Ensure the image covers the area
                width: double.infinity, // Fill the width of the container
                height:
                    1000, // Increased height for the image to make it longer
              ),
            ),
            // Heart icon for favorite toggle
            Positioned(
              top: 8,
              left: 8,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    isFavorite = !isFavorite; // Toggle favorite status
                  });
                },
                child: Icon(
                  isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: Colors.red,
                ),
              ),
            ),
            // Product details area
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.all(8.0),
                decoration: const BoxDecoration(
                  color: Colors.white, // Background color for text area
                  borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(10)), // Rounded bottom corners
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Product title
                    Text(widget.title,
                        style:
                            Theme.of(context).textTheme.displaySmall?.copyWith(
                                  fontWeight: FontWeight.bold,
                                )),
                    SizedBox(height: 4), // Space between title and category
                    // Product category
                    Text(
                      widget.category,
                      style: Theme.of(context).textTheme.displaySmall?.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                          color: Color.fromARGB(255, 170, 158, 158)),
                    ),
                    SizedBox(height: 4), // Space between category and price
                    // Product price
                    Text('\$${widget.price.toStringAsFixed(2)}',
                        style: Theme.of(context)
                            .textTheme
                            .displaySmall
                            ?.copyWith(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                                letterSpacing: 1)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
