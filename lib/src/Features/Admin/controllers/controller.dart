import 'dart:io';

import 'package:get/get.dart';

import '../widgets/file_picker.dart';

class Controllers extends GetxController {
  List<File> images = [];
  void selectImages() async {
    var res = await pickImages();
    images = res;
    update();
  }

  String category = 'TVs';
  void setCategory(String? newValue) {
    category = newValue!;
    update();
  }
}
