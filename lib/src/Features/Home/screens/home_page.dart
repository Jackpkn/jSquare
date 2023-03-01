import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jsquare/src/Features/Product_pages/tv_products/tv_products.dart';
import 'package:jsquare/src/GlobalWidgets/product_choose.dart';
import 'package:jsquare/src/controller/icon_visible_controler.dart';

import '../../../GlobalWidgets/cached_network_image.dart';
import '../../../GlobalWidgets/home_appbar.dart';
import '../../../models/product_models.dart';

enum Auth {
  appliances,
  furniture,
}

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  late bool isSelected = true;
  IconController iconController = Get.put(IconController());
  final Auth _auth = Auth.appliances;

  List<Widget> routes = [
    const TVsPage(),
    const TVsPage(),
    const TVsPage(),
    const TVsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.teal,
      appBar: appbar(),
      body: Padding(
        padding: const EdgeInsets.only(left: 2, right: 2),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 8,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Obx(() => Product(
                        name: 'Appliances',
                        isSelected: iconController.isSelected.value,
                        onTap: () {
                          iconController.isSelected.value =
                              !iconController.isSelected.value;
                          // setState(() {
                          //   isSelected = !isSelected;
                          // });
                        },
                        color: iconController.isSelected.value
                            ? Colors.black
                            : Colors.white,
                        width: MediaQuery.of(context).size.width * 0.47,
                        textColor: iconController.isSelected.value
                            ? Colors.white
                            : Colors.black,
                      )),
                  Obx(() => Product(
                        name: 'Furniture',
                        isSelected: iconController.isSelected.value,
                        color: iconController.isSelected.value
                            ? Colors.white
                            : Colors.black,
                        textColor: iconController.isSelected.value
                            ? Colors.black
                            : Colors.white,
                        onTap: () {
                          iconController.isSelected.value =
                              !iconController.isSelected.value;
                          // setState(() {
                          //   isSelected = !isSelected;
                          // });
                        },
                        width: MediaQuery.of(context).size.width * 0.47,
                      ))
                ],
              ),
            ),
            iconController.isSelected.value
                ? Expanded(
                    child: GridView.builder(
                        physics: const BouncingScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
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
                              Get.to(routes[i]);
                            },
                            child: SizedBox(
                              height: 90,
                              width: 90,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  CachedNetImage(
                                      imageUrl:
                                          productModel[i].image.toString(),
                                      height: 267,
                                      width: MediaQuery.of(context).size.width),
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
                  )
                : Obx(() => Expanded(
                      child: GridView.builder(
                          physics: const BouncingScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
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
                                Get.to(routes[i]);
                              },
                              child: SizedBox(
                                height: 90,
                                width: 90,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    CachedNetImage(
                                        imageUrl:
                                            productModel[i].image.toString(),
                                        height: 267,
                                        width:
                                            MediaQuery.of(context).size.width),
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
                                    const Text('jack kfjajfowopwk'),
                                  ],
                                ),
                              ),
                            );
                          }),
                    ))
          ],
        ),
      ),
    );
  }
}

// enum = auth auth  = sign up  = 
/*
 Expanded(
              child: GridView.builder(
                  physics: const BouncingScrollPhysics(),
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
                        Get.to(const ProductDetails());
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
                                width: MediaQuery.of(context).size.width),
                            const SizedBox(
                              height: 12,
                            ),
                            Text(
                              productModel[i].name.toString(),
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
*/
