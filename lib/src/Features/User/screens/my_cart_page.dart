import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../GlobalWidgets/cached_network_image.dart';
import '../../../GlobalWidgets/container.dart';
import '../../../models/productmodels.dart';
import '../Services/user_services.dart';

class MyCart extends StatelessWidget {
  MyCart({super.key});
  final UserServices userServices = Get.put(UserServices());
  void increaseQuantity(Product product) {
    userServices.increaseQuantity(product: product);
  }
  void decreaseQuantity(Product product) {
    userServices.decreaseQuantity(product: product);
  }

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
              ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 6,
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Column(
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
                              color: Colors.pink,
                              width: MediaQuery.of(context).size.width * 0.48,
                              padding: const EdgeInsets.all(0),
                              child: Stack(
                                // mainAxisAlignment: MainAxisAlignment.start,
                                // crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Align(
                                    alignment: Alignment.topCenter,
                                    child: Text(
                                      'Samsung 55 Inches 4k Neo Series Ultra HD Smart LED TV',
                                      style: TextStyle(fontSize: 18),
                                    ),
                                  ),
                                  const Align(
                                    alignment: Alignment.center,
                                    child: Align(
                                      alignment: Alignment.centerRight,
                                      child: Text(
                                        '₹1,198',
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 9,
                                  ),
                                  Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Positioned(
                                          left: 0,
                                          child: IconButton(
                                            onPressed: () {},
                                            icon: const Icon(
                                              Icons.delete,
                                            ),
                                          ),
                                        ),

                                        // GlobalContainer(
                                        //   height: 30,
                                        //   width: 112,
                                        //   borderWidth: 0.7,
                                        //   radius: 7,
                                        //   color: Colors.white,
                                        //   child: Row(
                                        //     mainAxisAlignment:
                                        //         MainAxisAlignment.spaceBetween,
                                        //     crossAxisAlignment:
                                        //         CrossAxisAlignment.center,
                                        //     children: [
                                        //       IconButton(
                                        //         alignment: Alignment.centerLeft,
                                        //         padding: const EdgeInsets.only(
                                        //           bottom: 1,
                                        //           right: 12,
                                        //         ),
                                        //         onPressed: () {},
                                        //         icon: const Icon(
                                        //           Icons.remove_circle_outline,
                                        //           color: Colors.grey,
                                        //         ),
                                        //       ),
                                        //       SizedBox(
                                        //         height: 14,
                                        //         width: 14,
                                        //         child: TextFormField(
                                        //           decoration: InputDecoration(
                                        //             contentPadding:
                                        //                 const EdgeInsets.only(
                                        //                     bottom: 0, top: 4),
                                        //             border: OutlineInputBorder(
                                        //               borderRadius:
                                        //                   BorderRadius.circular(1),
                                        //             ),
                                        //           ),
                                        //         ),
                                        //       ),
                                        //       IconButton(
                                        //         alignment: Alignment.center,
                                        //         padding: const EdgeInsets.only(
                                        //           bottom: 0.1,
                                        //           left: 20,
                                        //         ),
                                        //         onPressed: () {},
                                        //         icon: const Icon(
                                        //           Icons.add_circle_outline,
                                        //           color: Colors.grey,
                                        //         ),
                                        //       ),
                                        //     ],
                                        //   ),
                                        // ),
                                        Container(
                                          margin: const EdgeInsets.all(10),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                    color: Colors.black12,
                                                    width: 1.5,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                  color: Colors.white,
                                                ),
                                                child: Row(
                                                  children: [
                                                    InkWell(
                                                    //  onTap: () => decreaseQuantity(product),
                                                      child: Container(
                                                        width: 35,
                                                        height: 24,
                                                        alignment:
                                                            Alignment.center,
                                                        child: const Icon(
                                                          Icons.remove,
                                                          // size: ,
                                                        ),
                                                      ),
                                                    ),
                                                    DecoratedBox(
                                                      decoration: BoxDecoration(
                                                        border: Border.all(
                                                          color: Colors.black12,
                                                          width: 1.5,
                                                        ),
                                                        color: Colors.white,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(0),
                                                      ),
                                                      child: Container(
                                                        width: 35,
                                                        height: 29,
                                                        alignment:
                                                            Alignment.center,
                                                        child: const Text(
                                                          '2',
                                                          style: TextStyle(
                                                            color: Colors.black,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    InkWell(
                                                      // onTap: () => increaseQuantity(product),
                                                    // onTap: () => increaseQuantity(product),
                                                      child: Container(
                                                        width: 35,
                                                        height: 29,
                                                        alignment:
                                                            Alignment.center,
                                                        child: const Icon(
                                                          Icons.add,
                                                          // size: 18,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
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

                        //!  Checkout Button
                        // GlobalContainer(
                        //   height: 65,
                        //   width: MediaQuery.of(context).size.width * 0.99,
                        //   borderWidth: 1,
                        //   radius: 60,
                        //   child: const Text(
                        //     'Checkout',
                        //     style: TextStyle(
                        //       fontWeight: FontWeight.bold,
                        //       fontSize: 18,
                        //     ),
                        //   ),
                        // )
                      ],
                    );
                  }),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 1, top: 0.9),
        child: GlobalContainer(
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
        ),
      ),
    );
  }
}
