import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import '../constants/httperror_handling.dart';
import '../models/productmodels.dart';
import '../providers/product_provider.dart';
import '../providers/user_provider.dart';

class ProductController extends ChangeNotifier {
  RxInt like = 0.obs;
  RxInt dislike = 0.obs;
  final productList = <Product>[].obs;
  Future<List<Product>> fetchCategoryProducts({
    required String category,
    required BuildContext context,
  }) async {
    List<Product> productList = [];

    final userProvider = Provider.of<UserProvider>(context, listen: false);
    final productProvider =
        Provider.of<ProductProvider>(context, listen: false);
    try {
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
          notifyListeners();
          productProvider.setProductModel(productList);
        },
      );
    } catch (e) {
      debugPrint(e.toString());
      EasyLoading.showError(e.toString());
    }
    // print(product.length);
    return productList;
  }

  Future<void> likeProduct({
    required Product product,
    required BuildContext context,
  }) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    final productProvider =
        Provider.of<ProductProvider>(context, listen: false);
    try {
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
          for (int i = 0; i < jsonDecode(response.body).length; i++) {
            productList.add(
              Product.fromJson(
                jsonEncode(
                  jsonDecode(response.body)[i],
                ),
              ),
            );
          }
          // notifyListeners();
          productProvider.setProductModel(productList);
        },
      );
    } catch (e) {
      debugPrint(e.toString());
      EasyLoading.showError(e.toString());
    }
  }

  Future disLikeProduct(
      {required Product product, required BuildContext context}) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    final productProvider =
        Provider.of<ProductProvider>(context, listen: false);
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
          // notifyListeners();
          productProvider.setProductModel(productList);
        },
      );
    } catch (e) {
      EasyLoading.showError('something went wrong. Try again!');
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
    final productProvider =
        Provider.of<ProductProvider>(context, listen: false);
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
          for (var i = 0; jsonDecode(response.body).length; i++) {
            productList.add(
              Product.fromJson(
                jsonEncode(
                  jsonDecode(response.body)[i],
                ),
              ),
            );
          }

          notifyListeners();
          productProvider.setProductModel(productList);
          EasyLoading.showSuccess('Success');
        },
      );
    } catch (e) {
      EasyLoading.showError('something went wrong. Try again!');
      debugPrint(e.toString());
    }
  }

  Future<List<dynamic>> getWishProduct({
    required BuildContext context,
  }) async {
    final productList = <Product>[].obs;
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    try {
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
          List data = jsonDecode(response.body);
          productList.value = data.map((e) => Product.fromJson(e)).toList();
        },
      );
    } catch (e) {
      debugPrint(e.toString());
      EasyLoading.showError(e.toString());
    }
    return productList;
  }
}
