// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jsquare/src/Features/User/Services/user_services.dart';
import 'package:jsquare/src/models/productmodels.dart';

import 'package:jsquare/src/providers/user_provider.dart';

import '../../../GlobalWidgets/cached_network_image.dart';



class CartProduct extends StatefulWidget {
  int index;
  CartProduct({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  State<CartProduct> createState() => _CartProductState();
}

class _CartProductState extends State<CartProduct> {
  UserProvider userProvider = Get.put(UserProvider());
  UserServices userServices = Get.put(UserServices());
  void increaseQuantity(Product product) {
    userServices.increaseQuantity(product: product);
  }

  void decreaseQuantity(Product product) {
    userServices.decreaseQuantity(product: product);
  }

  void deleteProduct(Product product) {
    userServices.deleteAddToCartProduct(product: product);
  }

  @override
  Widget build(BuildContext context) {
    final productCart = userProvider.user.cart[widget.index];
    final product = Product.fromMap(productCart['product']);

    final quantity = productCart['quantity'];
    
    return Column(
      children: [
        Text("product id ${product.id.toString()}", style: const TextStyle(fontWeight: FontWeight.bold, ),),
        const SizedBox(height: 7,),
        Row(
          children: [
            SizedBox(
              height: 166,
              // width: MediaQuery.of(context).size.width * 0.47,
              child: CachedNetImage(
                
                imageUrl: "product.images[0]",
                height: 166,
                width: MediaQuery.of(context).size.width * 0.47,
              ),
            ),
            Container(
              height: 166,
              // color: Colors.pink,
                width:
                                      MediaQuery.of(context).size.width * 0.48,
              // width: MediaQuery.of(context).size.width * 0.48,
              padding: const EdgeInsets.all(0),
              child: Stack(
                // mainAxisAlignment: MainAxisAlignment.start,
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    
                    // 'Samsung 55 Inches 4k Neo Series Ultra HD Smart LED TV',
                    product.description,
                    // overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontSize: 18,
                    
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                          // '₹1,198',
                          "₹ ${product.price.toString()}"),
                    ),
                  ),
                  const SizedBox(
                    height: 9,
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Stack(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                onPressed: () {
                                  deleteProduct(product);
                                },
                                icon: const Icon(
                                  Icons.delete,
                                  size: 23,
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.black12,
                                    width: 1.5,
                                  ),
                                  borderRadius: BorderRadius.circular(5),
                                  // color: Colors.white,
                                ),
                                child: Row(
                                  children: [
                                    InkWell(
                                      // decrease quantity
                                      onTap: () => decreaseQuantity(product),
                                      child: Container(
                                        width: 35,
                                        height: 26,
                                        alignment: Alignment.center,
                                        child: const Icon(
                                          Icons.remove,
                                        ),
                                      ),
                                    ),
                                    DecoratedBox(
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colors.black12,
                                          width: 1.5,
                                        ),
                                        // color: Colors.white,
                                        borderRadius: BorderRadius.circular(0),
                                      ),
                                      child: Container(
                                        width: 35,
                                        height: 26,
                                        alignment: Alignment.center,
                                        child: Text(
                                          // '',
                                          quantity.toString(),
                                          style: const TextStyle(
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      // increase the quantity
                                      onTap: () => increaseQuantity(product),
                                      child: Container(
                                        width: 35,
                                     height: 26,
                                        alignment: Alignment.center,
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
                        ),
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
  }
}
