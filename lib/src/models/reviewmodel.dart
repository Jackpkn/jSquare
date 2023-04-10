import 'package:flutter/material.dart';

class ReviewModel {
  String? rating;
  IconData? starIcon;

  Color? starColor;
  ReviewModel({this.rating, this.starIcon, this.starColor});
}

List<ReviewModel> reviewmodel = [
  ReviewModel(
    rating: 'All',
    starColor: Colors.black,
  ),
  ReviewModel(
    rating: 'All',
    starColor: Colors.black,
  ),
  ReviewModel(
    rating: '5.0',
    starColor: Colors.green,
  ),
  ReviewModel(
    rating: '4.0',
    starColor: Colors.pink,
  ),
  ReviewModel(
      rating: '3.0',
      // starIcon: const Icon(Icons.star),
      starColor: Colors.yellow),
  ReviewModel(
    rating: '2.0',
    starColor: Colors.orange,
  ),
  ReviewModel(
    rating: '1.0',
    starColor: Colors.teal,
  ),
];
