import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jsquare/src/GlobalWidgets/textfromfield.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(6),
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      size: 28,
                      color: Colors.white,
                    ),
                  ),
                  Expanded(
                    child: TextFormInput(
                      hintText: 'Search Product',
                      labelText: 'Search AmoYou.com',
                      controller: controller,
                      obscureText: false,
                      maxLines: 1,
                      validator: (value) {
                        return null;
                      },
                    ),
                  )
                ],
              ),

            ],
          ),
        ),
      ),
    );
  }
}
