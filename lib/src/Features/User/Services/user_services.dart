import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:jsquare/src/constants/httperror_handling.dart';
import 'package:jsquare/src/models/order.dart';
import 'package:jsquare/src/models/productmodels.dart';
import 'package:jsquare/src/models/user_models.dart';
import 'package:jsquare/src/providers/user_provider.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

// final userProvider = Get.put(UserProvider());

class UserServices {
  // RxInt counter = 0.obs;
  // var productList = <Product>[].obs;
// var productList=  List<Product>.of(elements).obs;
  Future decreaseQuantity({
    required Product product,
    required BuildContext context,
  }) async {
    try {
      // var url = 'http://10.2.100.41:3000/api/remove-from-cart/${product.id}';
      final userProvider = Provider.of<UserProvider>(context, listen: false);
      http.Response response = await http.delete(
        Uri.parse("http://localhost:3000/api/remove-from-cart/${product.id}"),
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

  Future deleteAddToCartProduct({
    required Product product,
    required BuildContext context,
  }) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    try {
      // var uri = 'http://10.2.100.41:3000/api/delete-cart/${product.id}';
      var uri = 'http://localhost:3000/api/delete/${product.id}';

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
        },
      );
    } catch (e) {
      EasyLoading.showError('something went wrong. Try again!');
      debugPrint(e.toString());
    }
  }

  Future increaseQuantity(
      {required Product product, required BuildContext context}) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    try {
      // const uri = 'http://10.2.100.61:3000/api/add-to-cart';
      const uri = 'http://localhost:3000/api/add-to-cart';

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

  Future placeOrder({
    required String address,
    required double totalSum,
    required BuildContext context,
  }) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    try {
      // const url = 'http://10.2.100.61:3000/api/user-order';
      const url = 'http://localhost:3000/api/user-order';

      http.Response response = await http.post(
        Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': userProvider.user.token,
        },
        body: jsonEncode(
          {
            'cart': userProvider.user.cart,
            'address': address,
            'totalPrice': totalSum
          },
        ),
      );
      httpErrorHandle(
        response: response,
        onSuccess: () {
          EasyLoading.showSuccess('Your order has been placed');
          User user = userProvider.user.copyWith(cart: []);
          userProvider.setUserFromModel(user);
        },
      );
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<List<Order>> getOrder({required BuildContext context}) async {
    List<Order> orderList = [];
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    try {
      // const url = 'http://10.2.100.61:3000/api/get-user-order';
      const url = 'http://localhost:3000/api/get-user-order';

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
          // print(response.body);
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
      // update();
    } catch (e) {
      debugPrint(e.toString());
    }
    return orderList;
  }

  Future<void> updateProfile(
      {required String name,
      required String email,
      required String userName,
      required int phone,
      required BuildContext context}) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    try {
      final id = userProvider.user.id;
      // final url = 'http://10.2.100.61:3000/auth/update-user-profile/$id';
      final url = 'http://localhost:3000/auth/update-user-profile/$id';
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
          Get.find<UserProvider>().setUser(response.body);
          // print(response.body);
          EasyLoading.showSuccess(' your address Successfully update');
        },
      );
    } catch (e) {
      debugPrint(e.toString());
      EasyLoading.showError(e.toString());
    }
  }

  RxBool isFavourite = false.obs;
  void toggleChange() {
    isFavourite.value = !isFavourite.value;
  }

  Future<void> wishProduct({
    required Product product,
    required BuildContext context,
  }) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    try {
      // const url = 'http://10.2.100.61:3000/api/addToWishList';
      const url = 'http://localhost:3000/api/addToWishList';
      //  const url = 'http://10.2.100.41:3000/api/favourite';
      //  const url = 'http://10.2.100.61:3000/wishlist';
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
      // print(response.body);
      httpErrorHandle(
        response: response,
        onSuccess: () {
          User user = userProvider.user
              .copyWith(wishlist: jsonDecode(response.body)['wishlist']);
          userProvider.setUserFromModel(user);
          // print(user);
          EasyLoading.showSuccess('You have successfully linked to');
        },
      );
    } catch (e) {
      debugPrint(e.toString());
      EasyLoading.showError(e.toString());
    }
  }

  Future<List<dynamic>> getWishProduct({required BuildContext context}) async {
    List<dynamic> products = [];
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    try {
      // const url = 'http://10.2.100.61:3000/api/getWishProduct';
      const url = 'http://localhost:3000/api/getWishProduct';
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
          // products = json.decode(response.body);
          // print(response.body);
          User user = userProvider.user
              .copyWith(wishlist: jsonDecode(response.body)['wishlist']);
          userProvider.setUserFromModel(user);
        },
      );
    } catch (e) {
      debugPrint(e.toString());
      EasyLoading.showError(e.toString());
    }
    return products;
  }

  // RxInt like = 0.obs;
  // RxInt dislike = 0.obs;
  Future<void> likeProduct({
    required Product product,
    required BuildContext context,
  }) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    try {
      // var url = 'http://10.2.100.61:3000/api/like/${product.id}';
      var url = 'http://localhost:3000/api/like/${product.id}';
      http.Response response = await http.put(
        Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': userProvider.user.token,
        },
      );
      httpErrorHandle(
        response: response,
        onSuccess: () {
          // like++;
          // List data = jsonDecode(response.body);
          // data.removeWhere((element) => element.id == product.id);
          // print(response.body);
          // final d = data.map((e) => Product.fromJson(e)).toList();
        },
      );
    } catch (e) {
      debugPrint(e.toString());
      EasyLoading.showError(e.toString());
    }
  }

  //
  Future<void> disLikeProduct({
    required Product product,
    required BuildContext context,
  }) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    try {
      // var url = 'http://10.2.100.61:3000/api/disLike/${product.id}';
      var url = 'http://localhost:3000/api/disLike/${product.id}';
      http.Response response = await http.put(
        Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': userProvider.user.token,
        },
      );
      httpErrorHandle(
          response: response,
          onSuccess: () {
            // print(response.body);

          });
    } catch (e) {
      debugPrint(e.toString());
      EasyLoading.showError(e.toString());
    }
  }

  Future fetchReviews({required BuildContext context}) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    try {
      // var url = 'http://10.2.100.61:3000/api/get-reviews';
      var url = 'http://localhost:3000/api/get-reviews';
      http.Response response = await http.get(
        Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': userProvider.user.token,
        },
      );
      httpErrorHandle(response: response, onSuccess: () {});
    } catch (e) {
      debugPrint(e.toString());
      EasyLoading.showError(e.toString());
    }
  }
}
