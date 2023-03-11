import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;

void httpErrorHandle({
  required http.Response response,
  required VoidCallback onSuccess,
}) {
  switch (response.statusCode) {
    case 200:
      onSuccess();
      break;
    case 400:
      EasyLoading.showError(jsonDecode(response.body)['msg']);
      // Get.showSnackbar(

      //   GetSnackBar(
      //     message: jsonDecode(response.body)['msg'],
      //   ),
      // );
      break;
    case 500:
      EasyLoading.showError(jsonDecode(response.body)['error']);
      // GetSnackBar(
      //   message: jsonDecode(response.body)['error'],
      // );
      break;
    default:
      EasyLoading.showError(jsonDecode(response.body));
    // Get.showSnackbar(
    //   GetSnackBar(
    //     message: response.body,
    //   ),
    // );
  }
}
