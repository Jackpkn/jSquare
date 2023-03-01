import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jsquare/src/GlobalWidgets/rating.dart';

import '../GlobalWidgets/cached_network_image.dart';
import '../GlobalWidgets/container.dart';

class ProductDetailsWidget extends StatefulWidget {
  String? productImage;
  String? productName;
  String? productPrice;
  VoidCallback? onPressed;
    ProductDetailsWidget({super.key, this.productImage, this.productName, this.productPrice, this.onPressed});

  @override
  State<ProductDetailsWidget> createState() => _ProductDetailsWidgetState();
}

class _ProductDetailsWidgetState extends State<ProductDetailsWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:  widget.onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 7),
        child: SizedBox(
          height: 190,
          child: Row(
            children: [
              CachedNetImage(
                imageUrl:  widget.productImage.toString(),
                height: 190,
                width: MediaQuery.of(context).size.width * 0.46,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: SizedBox(
                  height: 190,
                  width: MediaQuery.of(context).size.width * 0.46,
                  child: Stack(
                    children: [
                      Text(
                       widget.productName.toString(),
                        style: const TextStyle(fontSize: 18),
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      const Positioned(
                        top: 100,
                        left: 12,
                        child: Row(
                          children: [
                            Text(
                              '5*',
                              style: TextStyle(fontSize: 16),
                            ),
                            SizedBox(
                              width: 2,
                            ),
                            RatingButton(
                              rating: 5,
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Positioned(
                        top: 128,
                        left: 5,
                        child: Text(
                          '₹${ widget.productPrice} per month',
                          style: const TextStyle(fontSize: 18),
                        ),
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      const Positioned(
                        bottom: 2,
                        right: 3,
                        left: 3,
                        child: GlobalContainer(
                          height: 30,
                          width: 181,
                          borderWidth: 1.4,
                          radius: 10,
                          color: Colors.white,
                          child: Text(
                            'Add to Cart',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
    
  }
}
