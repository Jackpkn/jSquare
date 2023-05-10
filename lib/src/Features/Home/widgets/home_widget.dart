// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import '../../../GlobalWidgets/cached_network_image.dart';
import '../../../models/product_models.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({
    super.key,
  });

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 1000,
      child: GridView.builder(
          // physics: const BouncingScrollPhysics(),
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
              // onTap: widget.onTap,
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
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          // color: Colors.black,
                          fontSize: 25,
                          fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Text(
                      productModel[i].description.toString(),
                      style: const TextStyle(
                          // color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w300),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
