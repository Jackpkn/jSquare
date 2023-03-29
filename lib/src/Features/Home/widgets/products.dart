// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jsquare/src/Features/Home/controllers/home_controller.dart';
import 'package:jsquare/src/Features/category/screens/category_product.dart';
import 'package:jsquare/src/providers/user_provider.dart';

import '../../../GlobalWidgets/cached_network_image.dart';
import '../../../models/product_models.dart';

class TabBarV extends StatelessWidget {
  TabBarV({super.key});
  List<String> items = [
    "Home",
    "Explore",
  ];
  void navigateToDealScreen(String category) {
    Get.toNamed(CategoryProduct.routeName, arguments: category);
  }
  UserProvider userProvider =Get.put(UserProvider());

  HomeController homeController = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {

    homeController.fetchCategoryProducts();
    return  
    SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: SizedBox(
        height: 900,
        child: GridView.builder(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.vertical,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 3 / 2,
              crossAxisSpacing: 8,
              mainAxisSpacing: 4,
              mainAxisExtent: 370,
            ),
            padding: const EdgeInsets.all(10.0),
            itemCount: productModel.length,
            itemBuilder: (ctx, i) {
              return GestureDetector(
                onTap: () {
                  navigateToDealScreen(
                    productModel[i].name.toString(),
                  );
                },
                child: SizedBox(
                  height: 90,
                  width: 90,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CachedNetImage(
                        imageUrl: productModel[i].image.toString(),
                        height: 267,
                        width: MediaQuery.of(context).size.width,
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Text(
                        productModel[i].name.toString(),
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                            fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Text(
                        productModel[i].description.toString(),
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w300),
                      ),
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}
