import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jsquare/src/Features/product_details_page.dart';
import 'package:jsquare/src/widgets/product_details_widget.dart';

import '../../../models/tv_models.dart';

class TVsPage extends StatelessWidget {
  const TVsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: <Widget>[
            ListView.builder(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                itemCount: tvModel.length,
                itemBuilder: (context, index) {
                  final data = tvModel[index];

                  return ProductDetailsWidget(
                    productImage: data.image,
                    productName: data.name,
                    productPrice: data.price.toString(),
                    onPressed: () {
                      Get.to(ProductDetails(
                        data: data,
                      ));
                    },
                  );
                })
          ],
        ),
      ),
    );
  }
}
