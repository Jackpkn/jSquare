import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeController extends GetxController {
  var isDarkMode = false;
  void changeTheme(state) {
    if (state == true) {
      isDarkMode = true;
      Get.changeTheme(ThemeData.dark());
    } else {
      isDarkMode = false;
      Get.changeTheme(ThemeData.light());
    }
  }
}
