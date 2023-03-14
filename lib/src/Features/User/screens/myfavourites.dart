import 'package:flutter/material.dart';

class FavouritesPage extends StatelessWidget {
  static const String routeName = 'favourites-page';
  const FavouritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Orders'),
      ),
      body: const Column(
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
 )
 )
            
            ],
          ),
        ],
      ),
    );
  }
}
