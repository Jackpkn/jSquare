import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RatingButton extends StatelessWidget {
  final double rating;
  final bool ignoreGestures;
  const RatingButton({
    super.key,
    required this.rating,
    required this.ignoreGestures,
  });

  @override
  Widget build(BuildContext context) {
    return RatingBar(
      initialRating: rating,
      direction: Axis.horizontal,
      ignoreGestures: ignoreGestures,
      allowHalfRating: true,
      itemCount: 5,
      itemSize: 25,
      ratingWidget: RatingWidget(
          full: const Icon(
            Icons.star,
            color: Colors.orange,
          ),
          half: const Icon(
            Icons.star_half,
            color: Colors.orange,
          ),
          empty: const Icon(
            Icons.star_outline,
            color: Colors.orange,
          )),
      onRatingUpdate: (value) {
        // setState(() {
        //   _ratingValue = value;
        // });
      },
    );
  }
}
