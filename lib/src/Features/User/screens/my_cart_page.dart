// ignore_for_file: must_be_immutable, unused_local_variable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jsquare/src/providers/user_provider.dart';
import 'package:provider/provider.dart';

import '../../../GlobalWidgets/container.dart';
import '../Services/user_services.dart';
import '../widgets/cartproduct.dart';

class MyCart extends StatelessWidget {
  static const String routeName = 'my-cart';

  MyCart({super.key});

  // UserProvider userProvider = Get.put(UserProvider());
  int sum = 0;
  // StreamController controller = StreamController();

  @override
  Widget build(BuildContext context) {
    UserServices userServices = Get.put(UserServices());
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    userProvider.user.cart
        .map((e) => sum += e['quantity'] * e['product']['price'] as int)
        .toList();
    double gst = sum * 0.18;
    // print(userProvider.user.cart);
    double discount = sum * 0.10;
    double amountToBePaid = gst + sum - discount;
    // controller.sink.add(userProvider.user.cart);
    return Scaffold(
      // backgroundColor: Colors.amber,
      appBar: AppBar(
        centerTitle: false,
        title: const Text(
          'My Cart',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 19,
          ),
        ),
      ),
      body: ViewPage(),
    );
  }
}

class ViewPage extends StatelessWidget {
  ViewPage({super.key});

  int sum = 0;
  UserServices userServices = Get.put(UserServices());

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    // final ca = controller.sink.add(userProvider.user.cart);
    userProvider.user.cart
        .map((e) => sum += e['quantity'] * e['product']['price'] as int)
        .toList();
    double gst = sum * 0.18;

    double discount = sum * 0.10;
    double amountToBePaid = gst + sum - discount;
    // print(gst);
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8, top: 12, bottom: 10),
      child: userProvider.user.cart.isEmpty
          ? const Center(
              child: Text('No product found'),
            )
          : SingleChildScrollView(
              child: Column(
                children: [
                  ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: userProvider.user.cart.length,
                    // itemCount: ca.length,
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      // final ja = l[index];

                      return CartProduct(index: index);
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Total',
                        style: TextStyle(
                            color: Color.fromARGB(153, 0, 0, 0),
                            fontSize: 17,
                            fontWeight: FontWeight.w600),
                      ),
                      Text(
                        '₹$sum',
                        style: const TextStyle(
                            color: Color.fromARGB(153, 0, 0, 0),
                            fontSize: 17,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'GST(18%)',
                          style: TextStyle(
                              color: Color.fromARGB(153, 6, 3, 3),
                              fontSize: 17,
                              fontWeight: FontWeight.w600),
                        ),
                        Text(
                          '₹${gst.toStringAsFixed(2)}',
                          style: const TextStyle(
                              color: Color.fromARGB(153, 7, 4, 4),
                              fontSize: 17,
                              fontWeight: FontWeight.w600),
                        ),
                      ]),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Discount(-10%)',
                        style: TextStyle(
                            color: Color.fromARGB(153, 16, 9, 9),
                            fontSize: 17,
                            fontWeight: FontWeight.w600),
                      ),
                      Text(
                        '₹${discount.toStringAsFixed(2)}',
                        style: const TextStyle(
                            color: Color.fromARGB(153, 5, 3, 3),
                            fontSize: 17,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Amount to be paid',
                        style: TextStyle(
                            color: Color.fromARGB(153, 0, 0, 0),
                            fontSize: 17,
                            fontWeight: FontWeight.w600),
                      ),
                      Text(
                        '₹${amountToBePaid.toStringAsFixed(2)}',
                        style: const TextStyle(
                          color: Color.fromARGB(153, 0, 0, 0),
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 1, top: 0.9),
                    child: GestureDetector(
                      onTap: () {
                        // Get.toNamed('checkout-page');
                        userServices.placeOrder(
                          address: 'this is a checkout ',
                          totalSum: 300,
                          context: context,
                        );
                      },
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
                ],
              ),
            ),
    );
  }
}
