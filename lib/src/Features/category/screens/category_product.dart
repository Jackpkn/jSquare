// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jsquare/src/Features/Product_Details/screens/product_details_page.dart';
import 'package:jsquare/src/Features/category/services/category_services.dart';
import 'package:jsquare/src/Features/category/widgets/product_details_widget.dart';
import 'package:jsquare/src/models/productmodels.dart';

import '../../../models/tv_models.dart';

class CategoryProduct extends StatefulWidget {
  static const String routeName = 'category-product';
  String category;
  CategoryProduct({super.key, required this.category});

  @override
  State<CategoryProduct> createState() => _CategoryProductState();
}

class _CategoryProductState extends State<CategoryProduct> {
  List<Product>? productList;
  CategoryServices categoryServices = CategoryServices();

  @override
  void initState() {
    super.initState();
    fetchCategoryProduct();
  }

  fetchCategoryProduct() async {
    productList =
        await categoryServices.fetchCategoryProduct(category: widget.category);
    setState(
      () {},
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.category),
      ),
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
                    Get.to(
                      ProductDetails(
                        data: data,
                      ),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
// flutter Node js  Authontication Second 