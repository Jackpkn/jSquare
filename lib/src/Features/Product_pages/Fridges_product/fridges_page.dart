import 'package:flutter/material.dart';

import '../../../models/frize_model.dart';
import '../../../GlobalWidgets/cached_network_image.dart';
import '../../../GlobalWidgets/container.dart';
import '../../../GlobalWidgets/rating.dart';

class FridgesPage extends StatelessWidget {
  const FridgesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: <Widget>[
          ListView.builder(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              itemCount: freeze.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 7, vertical: 7),
                  child: SizedBox(
                    height: 190,
                    child: Row(
                      children: [
                        CachedNetImage(
                          imageUrl: freeze[index].image.toString(),
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
                                  freeze[index].name.toString(),
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
                                    '₹${freeze[index].price.toString()} per month',
                                    style: const TextStyle(fontSize: 18),
                                  ),
                                ),
                                const SizedBox(
                                  height: 6,
                                ),
                                const Positioned(
                                  bottom: 2,
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
              })
        ],
      ),
    );
  }
}
