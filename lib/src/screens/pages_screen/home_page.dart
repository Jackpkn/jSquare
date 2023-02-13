import 'package:flutter/material.dart';

import '../../models/product_models.dart';
import '../../widgets/container.dart';
import '../../widgets/home_appbar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar(),
      body: Padding(
        padding: const EdgeInsets.only(top: 0, left: 5, right: 5),
        child: GridView.builder(
            physics: const BouncingScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 3 / 2,
              crossAxisSpacing: 2,
              mainAxisSpacing: 2,
              mainAxisExtent: 220,
            ),
            padding: const EdgeInsets.all(10.0),
            itemCount: productModel.length,
            itemBuilder: (ctx, i) {
              return Card(
                elevation: 2,
                child: container(
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        height: 160,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image:
                                NetworkImage(productModel[i].image.toString()),
                          ),
                        ),
                        width: MediaQuery.of(context).size.width,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        productModel[i].name.toString(),
                        style: const TextStyle(color: Colors.black),
                      ),
                      Text(
                        productModel[i].description.toString(),
                        style: const TextStyle(color: Colors.black),
                      ),
                    ],
                  ),
                  90,
                  90,
                ),
              );
            }),
      ),
    );
  }
}
