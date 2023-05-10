import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IconController extends GetxController {
  static IconController get instance => Get.find();
  RxBool isVisible = true.obs;
  var tabIndex = 0.obs;

  void changeTabIndex(int index) {
    tabIndex.value = index;
  }
}

class ImageController extends ChangeNotifier {
  var image ;
  Future setImage(var file) async {
    image = file;
    notifyListeners();
  }
}
