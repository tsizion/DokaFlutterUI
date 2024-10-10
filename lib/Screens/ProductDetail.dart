import 'package:doka/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class ProductDetail extends StatefulWidget {
  // Sample product data
  final String productName;
  final List<String> imageUrls;
  final String description;
  final double price;
  final String category; // Add category parameter

  const ProductDetail({
    Key? key,
    required this.productName,
    required this.imageUrls,
    required this.description,
    required this.price,
    required this.category, // Include category in constructor
  }) : super(key: key);

  @override
  _ProductDetailState createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  int _currentIndex = 0; // Track the current image index

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 250, 250, 250),
      appBar: AppBar(
        title: Text(
          'Product Detail',
          style: Theme.of(context).textTheme.displayMedium,
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite_border),
            onPressed: () {
              // Handle favorite action
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Use Expanded for the scrollable content
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // Product image container
                  Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    height: MediaQuery.of(context).size.height *
                        0.75, // 60% of screen height
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                          width: 10,
                          color: const Color.fromARGB(255, 255, 255, 255)),
                      borderRadius: const BorderRadius.vertical(
                          bottom: Radius.circular(20),
                          top: Radius.circular(20)),
                    ),
                    child: Column(
                      children: [
                        Expanded(
                          child: CarouselSlider.builder(
                            itemCount: widget.imageUrls.length,
                            itemBuilder: (context, index, realIndex) {
                              return Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                    image:
                                        NetworkImage(widget.imageUrls[index]),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              );
                            },
                            options: CarouselOptions(
                              height: 300, // Height of the carousel
                              autoPlay: true,
                              aspectRatio: 16 / 9,
                              viewportFraction: 1.0,
                              enableInfiniteScroll: true,
                              onPageChanged: (index, reason) {
                                setState(() {
                                  _currentIndex =
                                      index; // Update current index on page change
                                });
                              },
                              scrollDirection: Axis
                                  .horizontal, // Ensure horizontal scrolling
                            ),
                          ),
                        ),
                        // Image counter centered
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Center(
                            child: Text(
                              '${_currentIndex + 1}/${widget.imageUrls.length}',
                              style: const TextStyle(fontSize: 16),
                            ),
                          ),
                        ),
                        // Stars for reviews
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: List.generate(5, (index) {
                              return Icon(
                                index < 4 ? Icons.star : Icons.star_border,
                                color: Colors.amber,
                              );
                            }),
                          ),
                        ),
                        const SizedBox(
                            height: 10), // Space between stars and product name
                        // Product name aligned to the left
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              widget.productName,
                              style: Theme.of(context).textTheme.displayMedium,
                              textAlign: TextAlign.start,
                            ),
                          ),
                        ),
                        const SizedBox(
                            height:
                                5), // Space between product name and category
                        // Product category aligned to the left
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              widget.category, // Display the category here
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(
                                    color: Colors.grey,
                                    fontSize: 14,
                                  ),
                              textAlign: TextAlign.start,
                            ),
                          ),
                        ),
                        const SizedBox(
                            height: 5), // Space between category and price
                        // Product price aligned to the left
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              '\$${widget.price.toStringAsFixed(2)}',
                              style: Theme.of(context)
                                  .textTheme
                                  .displayLarge
                                  ?.copyWith(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                              textAlign: TextAlign.start,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20), // Space before description
                      ],
                    ),
                  ),
                  // Scrollable description box
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30.0, vertical: 10),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Description',
                            style: Theme.of(context).textTheme.displayMedium,
                          ),
                          const SizedBox(
                              height: 10), // Space before description text
                          // Scrollable description container
                          Container(
                            height: 150, // Set a fixed height for description
                            child: SingleChildScrollView(
                              child: Text(
                                widget.description,
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Add to cart button (non-scrollable)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: ElevatedButton(
              onPressed: () {
                // Handle add to cart action
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: textColorBold,
                minimumSize: const Size(double.infinity, 50), // Full width
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text(
                'Add to Cart',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          const SizedBox(height: 20), // Space at the bottom
        ],
      ),
    );
  }
}
