import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:jsquare/src/constants/httperror_handling.dart';
import 'package:jsquare/src/models/category_model.dart';
import 'package:jsquare/src/providers/user_provider.dart';

class CategoryProvider extends GetxController {
  UserProvider userProvider = Get.put(UserProvider());
 

  Future<List<CategoryModel>> getCategoryProduct() async {
    List<CategoryModel> categoryList = [];
    try {
      const url = 'http://10.2.100.41:3000/category/get-all-product';
      http.Response response = await http.get(
        Uri.parse(url),
        headers: <String, String>{
          'Content-type': 'application/json; charset=UTF-8',
          'x-auth-token': userProvider.user.token
        },
      );

      httpErrorHandle(
        response: response,
        onSuccess: () {
          for (int i = 0; i < jsonDecode(response.body).length; i++) {
            categoryList.add(
              CategoryModel.fromJson(
                jsonEncode(
                  jsonDecode(
                    response.body,
                  ),
                ),
              ),
            );
          }
        },
      );
    } catch (e) {
      debugPrint(e.toString());
    }
    return categoryList;
  }

  

}
