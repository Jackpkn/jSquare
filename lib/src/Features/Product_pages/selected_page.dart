import 'package:flutter/material.dart';
import 'package:jsquare/src/GlobalWidgets/product_choose.dart';

import '../../models/product_models.dart';
import '../../GlobalWidgets/cached_network_image.dart';

class SelectedPage extends StatelessWidget {
  SelectedPage({super.key});
  late bool isSelected = true;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 229, 223, 223),
          flexibleSpace: Padding(
            padding: const EdgeInsets.only(
              right: 4,
              top: 3,
              left: 4,
            ),
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.menu),
                        iconSize: 34,
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.search),
                        iconSize: 34,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        iconSize: 34,
                        icon: const Icon(Icons.shopping_cart),
                      ),
                      const CircleAvatar(
                        radius: 18,
                        backgroundColor: Colors.black,
                        child: Text('J'),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 1, vertical: 7),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Product(
                      name: 'Appliances',
                      isSelected: true,
                      onTap: () {},
                      width: MediaQuery.of(context).size.width * 0.466,
                    ),
                    Product(
                      name: 'Furniture',
                      isSelected: true,
                      onTap: () {},
                      width: MediaQuery.of(context).size.width * 0.466,
                    ),
                  ],
                ),
              ),
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
                        
                      },
                      child: SizedBox(
                        height: 90,
                        width: 90,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            CachedNetImage(
                              height: 267,
                              imageUrl: productModel[i].image.toString(),
                              width: MediaQuery.of(context).size.width,
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            Text(
                              productModel[i].name.toString(),
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 25,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(
                              height: 6,
                            ),
                            RichText(
                              text: const TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Starting from ',
                                    style: TextStyle(
                                      color: Colors.black,
                                    ),
                                    children: [
                                      TextSpan(
                                        text: "₹500",
                                        style: TextStyle(
                                          color: Colors.red,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
