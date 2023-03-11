import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jsquare/src/Features/Admin/services/admin_auth_services.dart';

import '../../../models/order.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  List<Order>? orders;
  final AdminController adminController = Get.put(AdminController());
  @override
  void initState() {
    super.initState();
  }

  void fetchOrders() async {
    orders = (await adminController.getAllProduct()).cast<Order>();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return orders == null
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : 
         GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: orders!.length,
            ),
            itemBuilder: (context, index) {
              final orderData = orders![index];
              return GestureDetector(
                onTap: () {},
                child: SizedBox(
                  height: 140,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black12,
                          width: 1.5,
                        ),
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.white,
                      ),
                      child: Container(
                        width: 180,
                        padding: const EdgeInsets.all(10),
                        child: Image.network(
                          orderData.products[0].images[0],
                          fit: BoxFit.fitHeight,
                          width: 180,
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          );
  }
}
