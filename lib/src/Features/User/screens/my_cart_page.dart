// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jsquare/src/providers/user_provider.dart';

import '../../../GlobalWidgets/container.dart';
import '../../../models/productmodels.dart';
import '../Services/user_services.dart';
import '../widgets/cartproduct.dart';

class MyCart extends StatelessWidget {
  MyCart({super.key});
  final UserServices userServices = Get.put(UserServices());
  void increaseQuantity(Product product) {
    userServices.increaseQuantity(product: product);
  }

  void decreaseQuantity(Product product) {
    userServices.decreaseQuantity(product: product);
  }

  UserProvider userProvider = Get.put(UserProvider());
  int sum = 0;

  @override
  Widget build(BuildContext context) {
    userProvider.user.cart
        .map((e) => sum += e['quantity'] * e['product']['price'] as int)
        .toList();
    double gst = sum * 0.18;

    double discount = sum * 0.10;
    double amountToBePaid = gst + sum - discount;

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
                  return CartProduct(
                    index: index,
                  );
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Total',
                    style: TextStyle(
                      color: Colors.white60,
                      fontSize: 17,
                    ),
                  ),
                  Text('₹$sum'),
                   const Text(
                    'GST(18%)',
                    style: TextStyle(
                      color: Colors.white60,
                      fontSize: 17,
                    ),
                  ),
                  Text('₹$gst'),
                   const Text(
                    'Discount(-10%)',
                    style: TextStyle(
                      color: Colors.white60,
                      fontSize: 17,
                    ),
                  ),
                  Text('₹$discount'),
                   const Text(
                    'Amount to be paid',
                    style: TextStyle(
                      color: Colors.white60,
                      fontSize: 17,
                    ),
                  ),
                  Text('₹$amountToBePaid'),
                 
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 1, top: 0.9),
        child: GestureDetector(
          onTap: () {},
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
      ),
    );
  }
}
