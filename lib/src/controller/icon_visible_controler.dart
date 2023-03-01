import 'package:get/get.dart';

class IconController extends GetxController {
  static IconController get instance => Get.find();
  RxBool isVisible = true.obs;
  RxBool isSelected = true.obs;
}
