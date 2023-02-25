import 'package:flutter/material.dart';
import 'package:jsquare/src/models/product_models.dart';
import 'package:jsquare/src/widgets/container.dart';

import '../../widgets/cached_network_image.dart';

class MyCart extends StatelessWidget {
  const MyCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'My Cart',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:
              const EdgeInsets.only(left: 8, right: 8, top: 12, bottom: 10),
          child: Column(
            children: [
              Row(
                children: [
                  SizedBox(
                    height: 166,
                    width: MediaQuery.of(context).size.width * 0.47,
                    child: CachedNetImage(
                      imageUrl:
                          'https://cdn.pixabay.com/photo/2012/04/12/19/06/fridge-30212_1280.png',
                      height: 166,
                      width: MediaQuery.of(context).size.width * 0.47,
                    ),
                  ),
                  Container(
                    height: 166,
                    width: MediaQuery.of(context).size.width * 0.48,
                    padding: const EdgeInsets.all(5),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Samsung 55 Inches 4k Neo Series Ultra HD Smart LED TV',
                          style: TextStyle(fontSize: 18),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        const Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            '₹1,198',
                          ),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.delete,
                                ),
                              ),
                              GlobalContainer(
                                height: 30,
                                width: 112,
                                borderWidth: 0.7,
                                radius: 7,
                                color: Colors.white,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    IconButton(
                                      alignment: Alignment.centerLeft,
                                      padding: const EdgeInsets.only(
                                        bottom: 1,
                                        right: 12,
                                      ),
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.remove_circle_outline,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 14,
                                      width: 14,
                                      child: TextFormField(
                                        decoration: InputDecoration(
                                          contentPadding: const EdgeInsets.only(
                                              bottom: 0, top: 4),
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(1),
                                          ),
                                        ),
                                      ),
                                    ),
                                    IconButton(
                                      alignment: Alignment.center,
                                      padding: const EdgeInsets.only(
                                        bottom: 0.1,
                                        left: 20,
                                      ),
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.add_circle_outline,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.car_crash_rounded,
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: RichText(
                      text: const TextSpan(
                        children: [
                          TextSpan(
                            text: 'To be delivered by ',
                            style: TextStyle(
                              color: Colors.black,
                            ),
                            children: [
                              TextSpan(
                                text: 'Saturday 25 Feb 2023',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              // ! Horizontal line
              const Divider(
                color: Colors.black,
              ),
              const SizedBox(
                height: 20,
              ),
              //!
              ListView.builder(
                itemCount: 4,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 4),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(checkout[index].name.toString()),
                        Text(
                          '₹${checkout[index].price}',
                        ),
                      ],
                    ),
                  );
                },
              ),
              const SizedBox(
                height: 17,
              ),

              //!  Checkout Button
              GlobalContainer(
                height: 65,
                width: MediaQuery.of(context).size.width * 0.99,
                borderWidth: 1,
                radius: 60,
                child: const Text(
                  'Checkout',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
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
