import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:jsquare/src/models/category_model.dart';
import 'package:jsquare/src/providers/user_provider.dart';

import '../../../constants/httperror_handling.dart';

class AdminCategoryProvider with ChangeNotifier {
  UserProvider userProvider = Get.put(UserProvider());
  Future<void> addCategoryProduct({
    required String types,
    required List<File> image,
    required String categoryName,
    required int strPrice,
  }) async {
    try {
      // List<String> imageUrls = [];
      CategoryModel categoryModel = CategoryModel(
        types: types,
        image: '',
        categoryName: categoryName,
        strPrice: strPrice,
      );
      const url = 'http://10.2.100.41:3000/category/add-product';
      http.Response response = await http.post(
        Uri.parse(url),
        headers: <String, String>{
          'Content-type': 'application/json; charset=UTF-8',
          'x-auth-token': userProvider.user.token
        },
        body: categoryModel.toJson(),
      );

      httpErrorHandle(
        response: response,
        onSuccess: () async {
          // Get.find<UserProvider>().setCategoryModel(
          //   response.body,
          // );
        },
      );
    } catch (e) {
      debugPrint(e.toString());
    }
    notifyListeners();
  }

  // Future<List<CategoryModel>> getCategoryProduct() async {
  //   List<CategoryModel> categoryList = [];
  //   try {
  //     const url = 'http://10.2.100.41:3000/category/get-all-product';
  //     http.Response response = await http.get(
  //       Uri.parse(url),
  //       headers: <String, String>{
  //         'Content-type': 'application/json; charset=UTF-8',
  //         // 'x-auth-token': userProvider.user.token
  //       },
  //     );

  //     httpErrorHandle(
  //       response: response,
  //       onSuccess: () {
  //         for (int i = 0; i < jsonDecode(response.body).length; i++) {
  //           categoryList.add(
  //             CategoryModel.fromJson(
  //               jsonEncode(
  //                 jsonDecode(response.body)[i],
  //               ),
  //             ),
  //           );
  //         }
  //       },
  //     );
  //   } catch (e) {
  //     debugPrint(e.toString());
  //   }
  //   return categoryList;
  // }

  Future<void> deleteCategoryProduct({
    required CategoryModel categoryModel,
  }) async {
    try {
      const url = 'http://10.2.100.41:3000/category/delete-product';
      http.Response response = await http.delete(
        Uri.parse(url),
        headers: <String, String>{
          'Content-type': 'application/json; charset=UTF-8',
          'x-auth-token': userProvider.user.token
        },
        body: jsonEncode(
          {
            'id': categoryModel.id,
          },
        ),
      );

      httpErrorHandle(
        response: response,
        onSuccess: () {},
      );
    } catch (e) {
      debugPrint(e.toString());
    }
    notifyListeners();
  }

  Future<void> updateCategoryProduct(
      {required CategoryModel categoryModel}) async {
    try {
      var url =
          'http://localhost:3000/category/update-product/${categoryModel.id}';
      http.Response response = await http.put(
        Uri.parse(url),
        headers: <String, String>{
          'Content-type': 'application/json; charset=UTF-8',
          'x-auth-token': userProvider.user.token
        },
        body: jsonEncode(
          {
            'id': categoryModel.id,
          },
        ),
      );

      httpErrorHandle(
        response: response,
        onSuccess: () {},
      );
    } catch (e) {
      debugPrint(e.toString());
    }
    notifyListeners();
  }
}
