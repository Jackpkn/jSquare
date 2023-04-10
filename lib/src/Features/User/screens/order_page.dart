import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jsquare/src/Features/User/Services/user_services.dart';
import 'package:jsquare/src/GlobalWidgets/container.dart';
import 'package:jsquare/src/providers/user_provider.dart';

import '../../../GlobalWidgets/cached_network_image.dart';
import '../../../models/order.dart';

class OrdersPage extends StatefulWidget {
  static const String routeName = 'orders-page';

  const OrdersPage({
    super.key,
  });

  @override
  State<OrdersPage> createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  List<Order>? orders;
  final UserProvider userProvider = UserProvider();
  final UserServices userServices = Get.put(UserServices());
  @override
  void initState() {
    super.initState();
    fetchOrders();
  }

  fetchOrders() async {
    orders = await userServices.getOrder();
    setState(() {});
  }

  void placeOrder() {
    userServices.placeOrder(address: 'Something is going on', totalSum: 500);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text(
          'Preview Order',
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 19),
        ),
      ),
      body: SingleChildScrollView(
        child: orders != null
            ? Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    orders == null
                        ? const CircularProgressIndicator()
                        : Column(
                            children: [
                              const Row(
                                children: [
                                  Icon(
                                    Icons.shopping_cart_checkout,
                                  ),
                                  Text(
                                    'Current Orders',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 23,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              ListView.builder(
                                physics: const BouncingScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: orders!.length,
                                itemBuilder: (context, index) {
                                  final data = orders![index];

                                  return Padding(
                                    padding: const EdgeInsets.only(
                                        left: 3, right: 3, bottom: 9, top: 9),
                                    child: Column(
                                      children: [
                                        GlobalContainer(
                                          height: 80,
                                          radius: 0,
                                          color: Colors.orange,
                                          width: double.infinity,
                                          borderWidth: 0.1,
                                          child: Column(
                                            children: [
                                              Text(data.id),
                                              const Text('OrderId'),
                                              const Text('Order Total: '),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 190,
                                          child: Row(
                                            children: [
                                              CachedNetImage(
                                                imageUrl:
                                                    'https://st4.depositphotos.com/3097111/38442/v/600/depositphotos_384422118-stock-illustration-realistic-microwave-oven-steel-vector.jpg',
                                                height: 190,
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.48,
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 4),
                                                child: SizedBox(
                                                  height: 190,
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.48,
                                                  child: const Stack(
                                                    children: [
                                                      Align(
                                                        alignment:
                                                            Alignment.topCenter,
                                                        child: Text(
                                                          'Samsung 55 Inches 4k Neo Series Ultra HD Smart LED TV',
                                                          style: TextStyle(
                                                              fontSize: 18),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                    const Row(
                      children: [
                        Icon(
                          Icons.cloud_circle_rounded,
                        ),
                        Text(
                          'Previous Orders',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 23,
                          ),
                        ),
                      ],
                    ),
                    ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 2,
                      itemBuilder: (context, index) {
                        // final data = tvModel[index];

                        return Padding(
                          padding: const EdgeInsets.only(
                              left: 3, right: 3, bottom: 9, top: 9),
                          child: Column(
                            children: [
                              const GlobalContainer(
                                height: 80,
                                radius: 0,
                                color: Colors.orange,
                                width: double.infinity,
                                borderWidth: 0.1,
                                child: Column(
                                  children: [
                                    Text('Order date 23 Aug 2023'),
                                    Text('OrderId'),
                                    Text('Order Total: '),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 190,
                                child: Row(
                                  children: [
                                    CachedNetImage(
                                      imageUrl:
                                          'https://st4.depositphotos.com/3097111/38442/v/600/depositphotos_384422118-stock-illustration-realistic-microwave-oven-steel-vector.jpg',
                                      height: 190,
                                      width: MediaQuery.of(context).size.width *
                                          0.48,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 4),
                                      child: SizedBox(
                                        height: 190,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.48,
                                        child: const Stack(
                                          children: [
                                            Align(
                                              alignment: Alignment.topCenter,
                                              child: Text(
                                                'Samsung 55 Inches 4k Neo Series Ultra HD Smart LED TV',
                                                style: TextStyle(fontSize: 18),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ),
              )
            : const CircularProgressIndicator(),
      ),
    );
  }
}
