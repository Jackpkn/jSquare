import 'package:get/get.dart';
import 'package:jsquare/src/Features/Admin/screens/admin_home_screen.dart';

class IconController extends GetxController {
  static IconController get instance => Get.find();
  RxBool isVisible = true.obs;
  RxBool isSelected = true.obs;
  final List _pages = [
    const AdminScreen(),
    const AdminScreen(),
    const AdminScreen(),
  ];
  int selectIndex = 0;
  upadates(int page) {
    selectIndex = page;
    update();
  }
}
