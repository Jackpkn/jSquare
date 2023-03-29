import 'package:get/get.dart';
import 'package:jsquare/src/providers/user_provider.dart';

import '../../../models/category_model.dart';
import '../services/home_service_provider.dart';

class HomeController extends GetxController {
  var tabStatus = true.obs;
  List<CategoryModel>? categoryList;
  UserProvider userProvider = Get.put(UserProvider());
  fetchCategoryProducts() async {
    final data = Get.put(CategoryProvider());
    categoryList = await data.getCategoryProduct();
    update();
  }

  @override
  void onInit() {
    fetchCategoryProducts();
    super.onInit();
  }

  void toggleTabs() {
    tabStatus.value = !tabStatus.value;
  }
}
