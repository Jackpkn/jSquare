import 'package:flutter/material.dart';
import 'package:jsquare/src/GlobalWidgets/rating.dart';

import '../../../GlobalWidgets/cached_network_image.dart';
import '../../../GlobalWidgets/container.dart';

class ProductDetailsWidget extends StatefulWidget {
  String? productImage;
  String? productName;
  String? productPrice;
  VoidCallback? onPressed;
  ProductDetailsWidget(
      {super.key,
      this.productImage,
      this.productName,
      this.productPrice,
      this.onPressed});

  @override
  State<ProductDetailsWidget> createState() => _ProductDetailsWidgetState();
}

class _ProductDetailsWidgetState extends State<ProductDetailsWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 3, right: 3, bottom: 7),
      child: SizedBox(
        height: 190,
        child: Row(
          children: [
            GestureDetector(
              onTap: widget.onPressed,
              child: CachedNetImage(
                imageUrl: widget.productImage.toString(),
                height: 190,
                width: MediaQuery.of(context).size.width * 0.482,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: SizedBox(
                height: 190,
                width: MediaQuery.of(context).size.width * 0.482,
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: Text(
                        widget.productName.toString(),
                        style: const TextStyle(fontSize: 18),
                      ),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    const Align(
                      alignment: Alignment.center,
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
                        '₹${widget.productPrice} per month',
                        style: const TextStyle(fontSize: 18),
                      ),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    const Positioned(
                      bottom: 1,
                      right: 1,
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
    );
  }
}
