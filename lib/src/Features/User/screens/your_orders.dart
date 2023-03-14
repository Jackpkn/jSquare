import 'package:flutter/material.dart';

class OrdersPage extends StatelessWidget {
  static const String routeName = 'orders-page';
  const OrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          Row(
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
              )
            ],
          ),
        ],
      ),
    );
  }
}
