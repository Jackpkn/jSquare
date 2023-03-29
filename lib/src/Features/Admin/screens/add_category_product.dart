// ignore_for_file: must_be_immutable

import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:jsquare/src/Features/Admin/services/admin_category_service.dart';
import 'package:jsquare/src/Features/Admin/widgets/file_picker.dart';
import 'package:jsquare/src/GlobalWidgets/container.dart';
import 'package:jsquare/src/GlobalWidgets/textfromfield.dart';
import 'package:provider/provider.dart';

class AddCategoryProduct extends StatefulWidget {
  const AddCategoryProduct({super.key});

  @override
  State<AddCategoryProduct> createState() => _AddCategoryProductState();
}

class _AddCategoryProductState extends State<AddCategoryProduct> {
  List<File> image = [];
  void selectImages() async {
    var res = await pickOneImage();

    setState(() {
      image = res;
    });
  }

  final categoryKey = GlobalKey<FormState>();

  TextEditingController typeController = TextEditingController();
  TextEditingController categoryNameController = TextEditingController();
  TextEditingController strPriceController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('add category product'),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: categoryKey,
          child: Column(
            children: [
              image.isNotEmpty
                  ? Image.network(
                      image.toString(),
                      height: 90,
                      width: 130,
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
              TextFormInput(
                maxLines: 1,
                obscureText: false,
                hintText: 'Select the product type',
                labelText: 'Product type',
                controller: typeController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter type of Product';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormInput(
                maxLines: 1,
                obscureText: false,
                hintText: 'Select the categoryName',
                labelText: 'Product Name',
                controller: categoryNameController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter categoryName of Product';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormInput(
                maxLines: 1,
                obscureText: false,
                hintText: 'Select the product type',
                labelText: 'Product type',
                controller: strPriceController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter type of Product';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                 if(categoryKey.currentState!.validate()){
                   context.read<AdminCategoryProvider>().addCategoryProduct(
                        types: typeController.text,
                        image: image,
                        categoryName: categoryNameController.text,
                        strPrice: int.parse(strPriceController.text),
                      );
                 }
                },
                child: GlobalContainer(
                  height: 40,
                  radius: 10,
                  color: Colors.amber,
                  width: MediaQuery.of(context).size.width,
                  borderWidth: 1,
                  child: const Text('Add product'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
