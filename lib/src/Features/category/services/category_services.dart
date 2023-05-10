import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:jsquare/src/constants/httperror_handling.dart';
import 'package:jsquare/src/models/productmodels.dart';
import 'package:jsquare/src/models/user_models.dart';
import 'package:jsquare/src/providers/user_provider.dart';
import 'package:provider/provider.dart';

import '../../../providers/product_provider.dart';

// final userProvider = Get.put(UserProvider());

class CategoryServices {
  Future<List<Product>> fetchCategoryProducts({
    required String category,
    required BuildContext context,
  }) async {
    List<Product> productList = [];

    final userProvider = Provider.of<UserProvider>(context, listen: false);
    final productProvider =
        Provider.of<ProductProvider>(context, listen: false);
    try {
      // final userProvider = Provider.of<UserProvider>(context, listen: false);

      //api/get-products
      // final url = 'http://10.2.100.41:3000/api/get-products?category=$category';
      // final url = 'http://10.2.100.61:3000/api/search?category=$category';
      final url = 'http://localhost:3000/api/search?category=$category';
      http.Response res = await http.get(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': userProvider.user.token,
        },
      );

      httpErrorHandle(
        response: res,
        onSuccess: () {
          for (int i = 0; i < jsonDecode(res.body).length; i++) {
            productList.add(
              Product.fromJson(
                jsonEncode(
                  jsonDecode(res.body)[i],
                ),
              ),
            );
          }
          // productProvider.setProductModel(productList);
        },
      );
    } catch (e) {
      debugPrint(e.toString());
      EasyLoading.showError(e.toString());
    }
    // print(product.length);
    return productList;
  }

  void sortBy({
    required Product product,
  }) {}

  var productList = [].obs;
  void addToCart({
    required Product product,
    required BuildContext context,
  }) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    try {
      // const url = 'http://10.2.100.61:3000/api/add-to-cart';
      const url = 'http://localhost:3000/api/add-to-cart';
      http.Response response = await http.post(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': userProvider.user.token,
        },
        body: jsonEncode(
          {
            'id': product.id,
          },
        ),
      );
      // print(response.body);
      httpErrorHandle(
        response: response,
        onSuccess: () {
          User user = userProvider.user.copyWith(
            cart: jsonDecode(response.body)['cart'],
          );

          userProvider.setUserFromModel(user);
          EasyLoading.showSuccess(
            'success',
          );
        },
      );
    } catch (e) {
      debugPrint(e.toString());
      EasyLoading.showError(e.toString());
    }
  }
}
// compare which is exist inside the database
// rate product
