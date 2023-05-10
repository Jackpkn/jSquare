import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jsquare/src/Features/Admin/services/admin_auth_services.dart';

import '../../../models/productmodels.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  List<Product>? products;
  AdminController adminController = Get.put(AdminController());
  @override
  void initState() {
    super.initState();
    fetchAllProducts();
  }

  fetchAllProducts() async {
    products = await adminController.getAllProduct();
    setState(() {});
  }

  void deleteProduct(Product product, int index) {
    adminController.deleteProduct(
      product: product,
      onSuccess: () {
        products!.removeAt(index);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Post Screen'),
      ),
      body: products == null
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemCount: products!.length,
              itemBuilder: (context, index) {
                final productData = products![index];
                return Column(
                  children: [
                    const SizedBox(
                        // height: 140,
                        // child: SingleProduct(
                        //   image: productData.images[0],
                        // ),
                        ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Expanded(
                          child: Text(
                            'productData.name',
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                        ),
                        IconButton(
                          onPressed: () => deleteProduct(productData, index),
                          icon: const Icon(
                            Icons.delete_outline,
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              },
            ),
    );
  }
}
