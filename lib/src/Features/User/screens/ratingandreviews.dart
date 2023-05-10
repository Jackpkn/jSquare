import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jsquare/src/Features/User/Services/user_services.dart';

class RatingAndReviews extends StatelessWidget {
  static const String routeName = 'rating-reviews-page';
    RatingAndReviews({super.key});
  final userServices = Get.put(UserServices());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Rating & Reviews')),
      body: Column(
        children: [
          Row(
            children: [
              GestureDetector(
                onTap: (){
                  userServices.fetchReviews(context: context);
                },
                child: const Icon(
                  Icons.shopping_cart_checkout,
                ),
              ),
              const Text(
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
