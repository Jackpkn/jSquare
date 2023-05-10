// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:get/get.dart';


class HomeController extends GetxController {
  // HomeController._(); //
  var tabStatus = true.obs;
  var isLoading = true.obs;
  // List<CategoryModel>? categoryList;
  var list = [].obs;


  fetchCategoryProducts() async {
    try {
      isLoading(false);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  void onInit() {
    fetchCategoryProducts();
    super.onInit();
  }
}
