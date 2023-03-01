import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
      Get.showSnackbar(
        GetSnackBar(
          message: jsonDecode(response.body)['msg'],
        ),
      );
      break;
    case 500:
      GetSnackBar(
        message: jsonDecode(response.body)['error'],
      );
      break;
    default:
      Get.showSnackbar(
        GetSnackBar(
          message: response.body,
        ),
      );
  }
}
