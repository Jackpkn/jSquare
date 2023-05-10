import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;
import 'package:jsquare/src/constants/httperror_handling.dart';
import 'package:jsquare/src/providers/user_provider.dart';
import 'package:provider/provider.dart';

import '../../../models/productmodels.dart';

// UserProvider userProvider = Get.put(UserProvider());

class ProductServices {
  void fetchAllProduct(
      {required String category, required BuildContext context}) async {
    try {
      const url = '';
      http.Response response = await http.get(
        Uri.parse(url),
        headers: <String, String>{
          'Content-type': 'application/json; charset=UTF-8',
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

  Future<void> ratingProduct({
    required Product product,
    required double star,
    required String message,
    required BuildContext context,
  }) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    try {
      // var url = 'http://10.2.100.41:3000/api/rating';
      var url = 'http://localhost:3000/api/rating';
      http.Response response = await http.put(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': userProvider.user.token,
        },
        body: jsonEncode(
          {
            'id': product.id,
            'star': star,
            'message': message,
          },
        ),
      );
      httpErrorHandle(
        response: response,
        onSuccess: () {
          // User user =userProvider.user.copyWith()
          EasyLoading.showSuccess('Success');
        },
      );
    } catch (e) {
      EasyLoading.showError('something went wrong. Try again!');
      debugPrint(e.toString());
    }
  }

  Future likesProduct(
      {required Product product, required BuildContext context}) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    try {
      var url = 'http://10.2.100.41:3000/api/like/${product.id}';
      http.Response response = await http.put(
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
      EasyLoading.showError('something went wrong. Try again!');
      debugPrint(e.toString());
    }
  }

  Future disLikeProduct(
      {required Product product, required BuildContext context}) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    try {
      var url = 'http://10.2.100.41:3000/api/disLike/${product.id}';
      http.Response response = await http.put(
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
      EasyLoading.showError('something went wrong. Try again!');
      debugPrint(e.toString());
    }
  }
}
