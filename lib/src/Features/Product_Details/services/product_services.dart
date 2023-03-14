import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:jsquare/src/constants/httperror_handling.dart';

class ProductServices {
  void fetchAllProduct({required String category}) async {
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
        onSuccess: () {

        },
      );
    } catch (e) {
      debugPrint(e.toString());
    }
  }
  
}
