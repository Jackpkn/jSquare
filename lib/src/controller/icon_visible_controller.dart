import 'package:get/get.dart';

class IconController extends GetxController {
  static IconController get instance => Get.find();
  RxBool isVisible = true.obs;
  var tabIndex = 0.obs;

  void changeTabIndex(int index) {
    tabIndex.value = index;
  }
}

 
