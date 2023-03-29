import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jsquare/src/Features/Admin/controllers/controller.dart';
import 'package:jsquare/src/Features/Admin/services/admin_auth_services.dart';
import 'package:jsquare/src/GlobalWidgets/container.dart';

import '../../../GlobalWidgets/textfromfield.dart';
import '../widgets/file_picker.dart';

class AdminAddProduct extends StatefulWidget {
  const AdminAddProduct({super.key});

  @override
  State<AdminAddProduct> createState() => _AdminAddProductState();
}

class _AdminAddProductState extends State<AdminAddProduct> {
  TextEditingController productNameController = TextEditingController();

  TextEditingController descriptionController = TextEditingController();

  TextEditingController priceController = TextEditingController();

  TextEditingController quantityController = TextEditingController();
  List<File> images = [];
  String category = 'TVs';

  final AdminController adminController = Get.put(AdminController());
  Controllers controller = Get.put(Controllers());
  final addProductFormKey = GlobalKey<FormState>();
  // @override
  // void dispose() {
  //   priceController.dispose();
  //   descriptionController.dispose();
  //   priceController.dispose();
  //   quantityController.dispose();

  //   super.dispose();
  // }
  List<String> productCategories = [
    'TVs',
    'Refrigerators',
    'fridges',
    'Washing Machines',
    'Microwave Ovens',
    'Water Purifiers',
    'Beds',
    'Sofas',
    'Wardrobes',
    'Chairs',
    'Tables'
  ];

  void sellProduct() {
    if (addProductFormKey.currentState!.validate() && images.isNotEmpty) {
      adminController.sellProduct(
        name: productNameController.text,
        description: descriptionController.text,
        price: double.parse(priceController.text),
        quantity: double.parse(
          quantityController.text,
        ),
        category: controller.category,
        images: images,
      );
    }
  }

  void selectImages() async {
    var res = await pickImages();
    setState(() {
      images = res;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: const [
          Text('Products'),
        ],
      ),
      body: SingleChildScrollView(
        child: Form(
          key: addProductFormKey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                images.isNotEmpty
                    ? CarouselSlider(
                        items: images.map((x) {
                          return Builder(
                            builder: (context) => Image.file(
                              x,
                              fit: BoxFit.cover,
                              height: 200,
                            ),
                          );
                        }).toList(),
                        options: CarouselOptions(
                          viewportFraction: 1,
                          height: 200,
                        ),
                      )
                    : GestureDetector(
                        onTap: selectImages,
                        child: DottedBorder(
                          dashPattern: const [10, 4],
                          radius: const Radius.circular(10),
                          strokeWidth: 2,
                          borderType: BorderType.RRect,
                          child: Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            height: 200,
                            width: MediaQuery.of(context).size.width,
                            child: const Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.folder_open,
                                ),
                                SizedBox(
                                  height: 40,
                                ),
                                Text('Select product images')
                              ],
                            ),
                          ),
                        ),
                      ),
                const SizedBox(
                  height: 30,
                ),
                TextFormInput(
                  controller: productNameController,
                  hintText: 'Product Name',
                  labelText: 'Select product',
                  obscureText: false,
                  maxLines: 1,
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormInput(
                  controller: descriptionController,
                  hintText: 'Put description about the product',
                  labelText: 'Description',
                  obscureText: false,
                  maxLines: 4,
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormInput(
                  controller: quantityController,
                  hintText: 'Quantity',
                  labelText: 'Quantity',
                  obscureText: false,
                  maxLines: 1,
                ),
                TextFormInput(
                  controller: priceController,
                  hintText: 'Price',
                  labelText: 'Price',
                  obscureText: false,
                  maxLines: 1,
                ),
                const SizedBox(
                  height: 15,
                ),
                SizedBox(
                  width: double.infinity,
                  child: DropdownButton(
                    // value: category,
                    value: category,
                    icon: const Icon(Icons.keyboard_arrow_down),
                    items: productCategories.map((String item) {
                      return DropdownMenuItem(
                        value: item,
                        child: Text(item),
                      );
                    }).toList(),
                    // onChanged: controller.setCategory,
                    onChanged: (String? newVal) {
                      setState(() {
                        category = newVal!;
                      });
                    },
                  ),
                ),
                 
                GestureDetector(
                  onTap: () {
                    
                    if (addProductFormKey.currentState!.validate()) {
                      adminController.sellProduct(
                        name: productNameController.text,
                        description: descriptionController.text,
                        price: double.parse(priceController.text),
                        quantity: double.parse(
                          quantityController.text,
                        ),
                        category: controller.category,
                        images: images,
                      );
                    }
                     
                  },
                  child: const GlobalContainer(
                    height: 40,
                    width: double.infinity,
                    borderWidth: 2,
                    color: Colors.amber,
                    radius: 10,
                    child: Text('Sell'),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
