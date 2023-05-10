import 'package:get/get.dart';

class CategoryController extends GetxController {
  final List<Map<String, dynamic>> productList = [];
  Rx<List<Map<String, dynamic>>> foundPlayers =
      Rx<List<Map<String, dynamic>>>([]);
  Rx<bool> found = Rx<bool>(false);
  @override
  void onInit() {
    super.onInit();
    foundPlayers.value = productList;
  }

  void filterPlayer(String playerName) {
    List<Map<String, dynamic>> results = [];
    if (playerName.isEmpty) {
      results = productList;
    } else {
      results = productList
          .where((element) => element['name']
              .toString()
              .toLowerCase()
              .contains(playerName.toLowerCase()))
          .toList();
    }
    foundPlayers.value = results;
  }
}
