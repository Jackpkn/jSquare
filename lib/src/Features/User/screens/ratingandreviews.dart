import 'package:flutter/material.dart';

class RatingAndReviews extends StatelessWidget {
  static const String routeName = 'rating-reviews-page';
  const RatingAndReviews({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Rating & Reviews')),
      body: const Column(
        children: [
          Row(
            children: [
              Icon(
                Icons.shopping_cart_checkout,
              ),
              Text(
                'Current Orders',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 23,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
