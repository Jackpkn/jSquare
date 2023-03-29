import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:jsquare/src/Features/User/controllers/user_controller.dart';
import 'package:jsquare/src/constants/httperror_handling.dart';
import 'package:jsquare/src/models/order.dart';
import 'package:jsquare/src/models/productmodels.dart';
import 'package:jsquare/src/models/user_models.dart';
import 'package:jsquare/src/providers/user_provider.dart';
import 'package:http/http.dart' as http;

final userProvider = Get.put(UserProvider());
UserController userController =Get.put(UserController());
class UserServices extends GetxController {
  Future  decreaseQuantity({required Product product}) async {
    // userController._streamController.stream;
    try {
      // var url = 'http://10.2.100.41:3000/api/remove-from-cart/${product.id}';
      http.Response response = await http.delete(
        Uri.parse("http://10.2.100.41:3000/api/remove-from-cart/${product.id}"),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': userProvider.user.token,
        },
      );
      httpErrorHandle(
        response: response,
        onSuccess: () {
          User user = userProvider.user
              .copyWith(cart: jsonDecode(response.body)['cart']);
          userProvider.setUserFromModel(user);
        },
      );
    } catch (e) {
      debugPrint(e.toString());
      EasyLoading.showError(e.toString());
    }
  } // ?product=$product.id

  Future  deleteAddToCartProduct({
    required Product product,
  }) async {
    try {
      // var uri = 'http://10.2.100.41:3000/api/delete-cart/${product.id}';
      var uri = 'http://10.2.100.41:3000/api/delete/${product.id}';

      http.Response response = await http.delete(
        Uri.parse(uri),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': userProvider.user.token,
        },
      );
      httpErrorHandle(
        response: response,
        onSuccess: () {
          User user = userProvider.user
              .copyWith(cart: jsonDecode(response.body)['cart']);
          userProvider.setUserFromModel(user);

          EasyLoading.showSuccess('Success fully ');
        },
      );
    } catch (e) {
      EasyLoading.showError('something went wrong. Try again!');
      debugPrint(e.toString());
    }
  }

  Future  increaseQuantity({required Product product}) async {
    try {
      const uri = 'http://10.2.100.41:3000/api/add-to-cart';

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

  Future  placeOrder({
    required String address,
    required double totalSum,
  }) async {
    try {
      const url = 'http://10.2.100.41:3000/api/user-order';

      http.Response response = await http.post(Uri.parse(url),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'x-auth-token': userProvider.user.token,
          },
          body: jsonEncode({
            'cart': userProvider.user.cart,
            'address': address,
            'totalPrice': totalSum
          }));
      httpErrorHandle(
        response: response,
        onSuccess: () {
          EasyLoading.showSuccess('Your order has been placed');
          User user = userProvider.user.copyWith(cart: []);
          userProvider.setUserFromModel(user);
        },
      );
      update();
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<List<Order>> getOrder() async {
    List<Order> orderList = [];
    try {
      const url = 'http://10.2.100.41:3000/api/get-order';

      http.Response response = await http.get(
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
            orderList.add(
              Order.fromJson(
                jsonEncode(
                  jsonDecode(response.body)[i],
                ),
              ),
            );
          }
        },
      );
      update();
    } catch (e) {
      debugPrint(e.toString());
    }
    return orderList;
  }

  Future<void> updateProfile({
    required String name,
    required String email,
    required String userName,
    required String phone,
  }) async {
    try {
      final id = userProvider.user.id;
      final url = 'http://10.2.100.41:3000/auth/update-user-profile/$id';
      http.Response response = await http.put(
        Uri.parse(
          url,
        ),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': userProvider.user.token,
        },
        body: jsonEncode(
          {
            'name': name,
            'email': email,
            'userName': userName,
            'phone': phone,
          },
        ),
      );
      httpErrorHandle(
        response: response,
        onSuccess: () {
          EasyLoading.showSuccess(' your address Successfully update');
        },
      );
      update();
    } catch (e) {
      debugPrint(e.toString());
      EasyLoading.showError(e.toString());
    }
  }

  RxBool isFavourite = false.obs;
  void toggleChange() {
    isFavourite.value = !isFavourite.value;
  }

  Future<void> wishProduct({required Product product}) async {
    try {
        const url = 'http://10.2.100.41:3000/api/addToWishList';
        //  const url = 'http://10.2.100.41:3000/api/favourite';
      http.Response response = await http.put(
        Uri.parse(url),
        headers: <String, String>{
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
          User user = userProvider.user
              .copyWith(wishlist: jsonDecode(response.body)['wishlist']);
          userProvider.setUserFromModel(user);
          EasyLoading.showSuccess('success');
        },
      );
    } catch (e) {
      debugPrint(e.toString());
      EasyLoading.showError(e.toString());
    }
  }

  Future<List<dynamic>> getWishProduct() async {
    List<dynamic> products = [];
    try {
      const url = 'http://10.2.100.41:3000/api/getWishProduct';
      http.Response response = await http.get(
        Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': userProvider.user.token,
        },
      );
      httpErrorHandle(
        response: response,
        onSuccess: () {
          products = json.decode(response.body);
        },
      );
    } catch (e) {
      debugPrint(e.toString());
      EasyLoading.showError(e.toString());
    }
    return products;
  }
}
