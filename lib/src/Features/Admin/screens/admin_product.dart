import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';

import '../../../GlobalWidgets/textfromfield.dart';

class AdminProduct extends StatelessWidget {
  AdminProduct({super.key});
  TextEditingController productName = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: const [
          Text('Products'),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              DottedBorder(
                dashPattern: const [10, 4],
                radius: const Radius.circular(10),
                strokeWidth: 2,
                borderType: BorderType.RRect,
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  height: 150,
                  width: MediaQuery.of(context).size.width,
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.folder_open,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text('Select product images')
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormInput(
                controller: productName,
                hintText: 'Product Name',
                labelText: 'Select product',
                obscureText: false,
                maxLines: 1,
              ),
              const SizedBox(
                height: 15,
              ),
              TextFormInput(
                controller: productName,
                hintText: 'Put description about the product',
                labelText: 'Description',
                obscureText: false,
                maxLines: 4,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
