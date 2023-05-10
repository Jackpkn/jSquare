import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:jsquare/src/constants/httperror_handling.dart';
import 'package:jsquare/src/models/category_model.dart';
import 'package:jsquare/src/providers/user_provider.dart';
import 'package:provider/provider.dart';

class CategoryProvider extends GetxController {
  Future fetchProduct({required BuildContext context}) async {
    try {
      const url = 'http://localhost:3000/category/get-all-product';
      http.Response response = await http.get(
        Uri.parse(url),
        headers: <String, String>{
          'Content-type': 'application/json; charset=UTF-8',
          'Accept': 'application/json',
          // 'x-auth-token': userProvider.user.token
          'x-auth-token':
              Provider.of<UserProvider>(context, listen: false).user.token
        },
      );
      httpErrorHandle(
        response: response,
        onSuccess: () {
         
        },
      );
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  var appliancesList = <CategoryModel>[].obs;
  var furnitureList = <CategoryModel>[].obs;
  var isLoading = true.obs;
  Future fetchApplianceProducts({required BuildContext context}) async {
    try {
      http.Response response = await http.get(
        Uri.parse(
            'http://localhost:3000/category/get-all-product?types=Appliances'),
        headers: <String, String>{
          'Content-type': 'application/json; charset=UTF-8',
          'Accept': 'application/json',
          // 'x-auth-token': userProvider.user.token
          'x-auth-token':
              Provider.of<UserProvider>(context, listen: false).user.token
        },
      );
      // debugPrint(response.body);
      httpErrorHandle(
        response: response,
        onSuccess: () {
          List data = jsonDecode(response.body); // convert json to map
          appliancesList.value =
              data.map((e) => CategoryModel.fromJson(e)).toList(); //
          isLoading.value = false;
          // debugPrint(appliancesList.toString());
          update();
        },
      );
    } catch (e) {
      debugPrint(e.toString());
      Get.snackbar('Error Loading data!', 'Sever responded: ${e.toString()}',
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  Future fetchFurnitureProducts({required BuildContext context}) async {
    try {
      http.Response response = await http.get(
        Uri.parse(
            'http://localhost:3000/category/get-all-product?types=Appliances'),
        headers: <String, String>{
          'Content-type': 'application/json; charset=UTF-8',
          'Accept': 'application/json',
          'x-auth-token':
              Provider.of<UserProvider>(context, listen: false).user.token
        },
      );
      // debugPrint(response.body);
      httpErrorHandle(
        response: response,
        onSuccess: () {
          List data = jsonDecode(response.body); // convert json to map
          furnitureList.value = data
              .map((e) => CategoryModel.fromJson(e))
              .toList(); // covert it into object assign to list
          // debugPrint(furnitureList.toString());
          isLoading.value = false;
          update();
        },
      );
    } catch (e) {
      debugPrint(e.toString());
      Get.snackbar('Error Loading data!', 'Sever responded: ${e.toString()}',
          snackPosition: SnackPosition.BOTTOM);
    }
  }
}
