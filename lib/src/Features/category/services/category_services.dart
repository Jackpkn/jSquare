import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:jsquare/src/constants/httperror_handling.dart';
import 'package:jsquare/src/models/productmodels.dart';
import 'package:jsquare/src/models/user_models.dart';
import 'package:jsquare/src/providers/user_provider.dart';


 final userProvider = Get.put(UserProvider());
class CategoryServices {
  Future<List<Product>> fetchCategoryProducts({
    required String category,
    required BuildContext context
  }) async {
    List<Product> productList = [];
  try { 
      // final userProvider = Provider.of<UserProvider>(context, listen: false);

// /api/get-products
      final url = 'http://10.2.100.41:3000/api/get-products?category=$category';
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
          // var taskJson = json.decode(res.body);
          // for (var json in taskJson) {
          //   Product product = Product.fromJson(json);
          //   productList.add(product);
          //   // debugPrint(res);
          // }
         
          for (int i = 0; i < jsonDecode(res.body).length; i++) {
            productList.add(
              Product.fromJson(
                jsonEncode(
                  jsonDecode(res.body)[i],
                ),
              ),
            );
          }
        },
      );
    } catch (e) {
      debugPrint(e.toString());
       EasyLoading.showError(e.toString());
    }
    return productList;
  }

  void addToCart({required Product product}) async {
    try {
      
      
      const url = 'http://10.2.100.41:3000/api/add-to-cart';
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
      httpErrorHandle(
        response: response,
        onSuccess: () {
          User user = userProvider.user.copyWith(
            cart: jsonDecode(response.body)['cart'],

          );
         EasyLoading.showSuccess('success');
          userProvider.setUserFromModel(user);
        },
      );
    } catch (e) {   
      debugPrint(e.toString());
      EasyLoading.showError(e.toString());
    }
  }
}
