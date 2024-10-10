import 'package:flutter/material.dart';

class Review {
  final String username;
  final String comment;
  final double rating;

  Review({
    required this.username,
    required this.comment,
    required this.rating,
  });
}

class ReviewWidget extends StatelessWidget {
  final Review review;
  final int totalReviews; // Total number of reviews
  final double percentage; // Percentage of positive reviews

  const ReviewWidget({
    Key? key,
    required this.review,
    this.totalReviews = 500, // Default total reviews
    this.percentage = 89.0, // Default percentage of positive reviews
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to the review screen (to be implemented)
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ReviewDetailScreen(review: review),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Reviews summary
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Reviews ($totalReviews)',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '$percentage% 5-star rating',
                      style: const TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
                Text(
                  '${review.rating.toStringAsFixed(2)} *****',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            // Display the rating stars
            Row(
              children: List.generate(5, (index) {
                return Icon(
                  index < review.rating.round()
                      ? Icons.star
                      : Icons.star_border,
                  color: Colors.amber,
                );
              }),
            ),
            const SizedBox(height: 10),
            // Display the username
            Text(
              review.username,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            // Display the review comment
            Text(
              review.comment,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 10),
            // See all reviews button
            TextButton(
              onPressed: () {
                // Handle see all reviews action (to be implemented)
              },
              child: const Text(
                'See all reviews',
                style: TextStyle(color: Colors.blue),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Sample Review Detail Screen (to be implemented)
class ReviewDetailScreen extends StatelessWidget {
  final Review review;

  const ReviewDetailScreen({Key? key, required this.review}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Review Detail'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: List.generate(5, (index) {
                return Icon(
                  index < review.rating.round()
                      ? Icons.star
                      : Icons.star_border,
                  color: Colors.amber,
                );
              }),
            ),
            const SizedBox(height: 10),
            Text(
              review.username,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            const SizedBox(height: 10),
            Text(
              review.comment,
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
