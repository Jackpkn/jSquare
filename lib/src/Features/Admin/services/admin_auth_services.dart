import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jsquare/src/constants/httperror_handling.dart';
import 'package:jsquare/src/models/productmodels.dart';
import 'package:jsquare/src/providers/user_provider.dart';
import 'package:cloudinary_public/cloudinary_public.dart';

import 'package:http/http.dart' as http;

class AdminController extends GetxController {
//! upload api
  Future uploadProduct(
      {required String name,
      required description,
      required double price,
      required double quantity,
      required String category,
      required List<File> images}) async {
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

      final url = Uri.parse('uri');

      http.Response response = await http.post(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': userProvider.user.token,
        },
        body: product.toJson(),
      );
      httpErrorHandle(
        response: response,
        onSuccess: () {
          Get.showSnackbar(
            const GetSnackBar(
              message: 'Product added successfully',
            ),
          );
          Get.back();
        },
      );
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<List<Product>> getAllProduct() async {
    const url = '';
    final userProvider = Get.put(UserProvider());
    List<Product> productList = [];
    try {
      http.Response response = await http.post(
        Uri.parse(url),
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
}
