// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:jsquare/src/Features/Product_Details/services/product_services.dart';
import 'package:jsquare/src/GlobalWidgets/container.dart';

import '../../../GlobalWidgets/textfromfield.dart';
import '../../../models/productmodels.dart';

class RatingScreen extends StatefulWidget {
  // static const String routeName = 'rate-product';
  final Product product;
  const RatingScreen({super.key, required this.product});

  @override
  State<RatingScreen> createState() => _RatingScreenState();
}

class _RatingScreenState extends State<RatingScreen> {
  TextEditingController messageController = TextEditingController();

  ProductServices productServices = Get.put(ProductServices());

  late double star;
  final _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Form(
        key: _key,
        child: Column(
          children: [
            const Text(
              'Rate Product',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
            RatingBar.builder(
              initialRating: 0,
              itemCount: 5,
              allowHalfRating: true,
              direction: Axis.horizontal,
              minRating: 1,
              itemPadding: const EdgeInsets.symmetric(horizontal: 4),
              onRatingUpdate: (rating) {
                setState(() {
                  star = rating;
                });
              },
              itemBuilder: (context, index) => const Icon(
                Icons.star,
                color: Colors.orange,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              'Write Review',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
            TextFormInput(
              controller: messageController,
              hintText: 'Write your review here',
              labelText: 'Your review',
              obscureText: false,
              maxLines: 4,
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return "This field can't be empty";
                }

                return null;
              },
            ),
            GestureDetector(
              onTap: () {
                if (star == 0) {
                  EasyLoading.showError('Please rate the product');
                } else {
                  productServices.ratingProduct(
                    product: widget.product,
                    star: star,
                    message: messageController.text.trim(),
                  );
                }
              },
              child: GlobalContainer(
                height: 40,
                color: Colors.amber,
                radius: 10,
                width: MediaQuery.of(context).size.width,
                borderWidth: 1,
                child: const Text(
                  'Submit Review',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
