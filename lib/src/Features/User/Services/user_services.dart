import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jsquare/src/constants/httperror_handling.dart';
import 'package:jsquare/src/models/productmodels.dart';
import 'package:jsquare/src/models/user_models.dart';
import 'package:jsquare/src/providers/user_provider.dart';
import 'package:http/http.dart' as http;

class UserServices extends GetxController {
  void decreaseQuantity({required Product product}) async {
    const url = '';
    final userProvider = Get.put(UserProvider());
    try {
      http.Response response = await http.delete(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': userProvider.user.token,
        },
      );
      httpErrorHandle(
        response: response,
        onSuccess: () {},
      );
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void increaseQuantity({required Product product}) async {
    try {
      const uri = '';
      final userProvider = Get.put(UserProvider());
      http.Response response = await http.post(Uri.parse(uri),
          body: jsonEncode({
            'id': product.id!,
          }),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'x-auth-token': userProvider.user.token,
          });
      httpErrorHandle(
        response: response,
        onSuccess: () {
          User user = userProvider.user.copyWith(
            cart: jsonDecode(response.body)['cart'],
          );
          userProvider.setUserFromModel(user);
        },
      );
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void deleteAddToCartProduct({
    required Product product,
  }) async {
    try {
      const uri = '';
      final userProvider = Get.put(UserProvider());
      http.Response response =
          await http.delete(Uri.parse(uri), headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'x-auth-token': userProvider.user.token,
      });
      httpErrorHandle(
        response: response,
        onSuccess: () {},
      );
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
