
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jsquare/ts.dart';

class ProductAddScreen extends StatefulWidget {
  const ProductAddScreen({super.key});

  @override
  State<ProductAddScreen> createState() => _ProductAddScreenState();
}

class _ProductAddScreenState extends State<ProductAddScreen> {
  final ProductController productController = Get.put(ProductController());
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Form(
          key: key,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: emailController,
              ),
              TextFormField(
                controller: passwordController,
              ),
              ElevatedButton(
                onPressed: () {
                  // productController.getProduct();
                  // productController.loginUser(
                  //     email: emailController.text.trim(),
                  //     password: passwordController.text.trim());
                  // passwordController.
                },
                child: const Text(
                  'Add Product',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
