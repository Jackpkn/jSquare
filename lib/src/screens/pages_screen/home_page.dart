import 'package:flutter/material.dart';
import 'package:jsquare/src/widgets/cached_network_image.dart';

import '../../models/product_models.dart';
import '../../widgets/home_appbar.dart';
import '../../widgets/product_choose.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  late bool isSelected = true;
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
            Container(
              color: Colors.black,
              height: 3,
              width: MediaQuery.of(context).size.width,
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              // mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.search,
                    size: 34,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Product(
                        name: 'Appliances',
                        isSelected: true,
                        onTap: () {},
                        width: MediaQuery.of(context).size.width * 0.32),
                    const SizedBox(
                      width: 4,
                    ),
                    Product(
                      name: 'Furniture',
                      isSelected: false,
                      onTap: () {},
                      width: MediaQuery.of(context).size.width * 0.32,
                    ),
                  ],
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.menu,
                    size: 34,
                  ),
                )
              ],
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
                      onTap: () {},
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
          ],
        ),
      ),
    );
  }
}
