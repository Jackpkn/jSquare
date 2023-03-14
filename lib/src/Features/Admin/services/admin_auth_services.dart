import 'dart:convert';
import 'dart:io';

import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:jsquare/src/constants/httperror_handling.dart';
import 'package:jsquare/src/models/productmodels.dart';
import 'package:jsquare/src/providers/user_provider.dart';

import 'package:http/http.dart' as http;

class AdminController extends GetxController {
//! upload api
  
 

  Future sellProduct({
    required String name,
    required description,
    required double price,
    required double quantity,
    required String category,
    required List<File> images,
  }) async {
    final userProvider = Get.put(UserProvider());
    try {
      final cloudinary = CloudinaryPublic('denfgaxvg', 'uszbstnu');
      List<String> imageUrls = [];
      for (int i = 0; i < images.length; i++) {
        CloudinaryResponse res = await cloudinary.uploadFile(
          CloudinaryFile.fromFile(
            images[i].path,
            folder: name,
          ),
        );
        imageUrls.add(res.secureUrl);
      }

      Product product = Product(
        name: name,
        description: description,
        quantity: quantity,
        images: imageUrls,
        category: category,
        price: price,
      );
      const String uploadUrl = 'http://10.2.100.41:/admin/add-product';

      http.Response response = await http.post(
        Uri.parse(uploadUrl),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': userProvider.user.token,
        },
        body: product.toJson(),
      );
      httpErrorHandle(
        response: response,
        onSuccess: () {
          EasyLoading.showSuccess('Product added successfully');
          // Get.showSnackbar(
          //   const GetSnackBar(
          //     message: 'Product added successfully',
          //   ),
          // );
          Get.back();
        },
      );
    } catch (e) {
      EasyLoading.showError('Something wrong. Try again!');
      debugPrint(e.toString());
    }finally{
      EasyLoading.dismiss();
    }
  }
//

  Future<List<Product>> getAllProduct() async {
    const String getUrl = 'http://10.2.100.41:3000/admin/add-product';
    final userProvider = Get.put(UserProvider());
    List<Product> productList = [];
    try {
      http.Response response = await http.post(
        Uri.parse(getUrl),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': userProvider.user.token,
        },
      );
      httpErrorHandle(
        response: response,
        onSuccess: () {
          for (int i = 0; i < jsonDecode(response.body).length; i++) {
            productList.add(
              Product.fromJson(
                jsonEncode(
                  jsonDecode(response.body)[i],
                ),
              ),
            );
          }
        },
      );
    } catch (e) {
      debugPrint(e.toString());
    }
    return productList;
  }

  void deleteProduct({
    required Product product,
    required VoidCallback onSuccess,
  }) async {
    final userProvider = Get.put(UserProvider());
    const String deleteUrl = 'http://10.2.100.41:3000/admin/add-product';
    try {
      http.Response response = await http.post(
        Uri.parse(deleteUrl),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': userProvider.user.token,
        },
        body: jsonEncode(
          {'id': product.id},
        ),
      );
      httpErrorHandle(
        response: response,
        onSuccess: () {
          onSuccess();
        },
      );
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
