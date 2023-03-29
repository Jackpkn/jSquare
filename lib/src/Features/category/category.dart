import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jsquare/src/Features/category/screens/category_product.dart';
import 'package:jsquare/src/models/product_models.dart';

class Category extends StatelessWidget {
  const Category({super.key});
  void navigateToDealScreen(String category) {
    Get.toNamed(CategoryProduct.routeName, arguments: category);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Appliances'),
            ListView.builder(
              itemCount: productModel.length,
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: ListTile(
                    onTap: () {
                      navigateToDealScreen(
                        productModel[index].name.toString(),
                      );
                    },
                    // shape: BoxShape.circle,
                    title: Text(productModel[index].name.toString()),
                    focusColor: Colors.orange,
                    leading: const Icon(
                      Icons.tv,
                      color: Colors.black,
                    ),
                  ),
                );
              },
            ),
            const Text('Furniture'),
            ListView.builder(
              itemCount: productModel.length,
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: ListTile(
                    shape: Border.all(color: Colors.pink),
                    title: Text(productModel[index].name.toString()),
                    focusColor: Colors.orange,
                    leading: const Icon(Icons.ios_share),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
