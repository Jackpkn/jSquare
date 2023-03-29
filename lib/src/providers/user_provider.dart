import 'package:jsquare/src/models/category_model.dart';
import 'package:jsquare/src/models/user_models.dart';

import 'package:get/get.dart';
// class UserProvider extends ChangeNotifier {
//   User _user = User(
//     id: '',
//     name: '',
//     email: '',
//     password: '',
//     // address: [],
//     phone: '',
//     address: [],
//     type: '',
//     token: '',
//     cart: [],
//   );
//   User get user => _user;
//   void setUser(String user) {
//     _user = User.fromJson(user);
//     notifyListeners();
//   }

//   void setUserFromModel(User user) {
//     _user = user;
//     notifyListeners();
//   }
// }

class UserProvider extends GetxController {
  User _user = User(
    id: '',
    name: '',
    email: '',
    userName: '',
    password: '',
    phone: 0,
    wishlist: [],
    image: '',
    address: [],
    type: '',
    token: '',
    cart: [],
  );
  User get user => _user;
  void setUser(String user) {
    _user = User.fromJson(user);
    update();
  }

  void setUserFromModel(User user) {
    _user = user;
    update();
  }

  CategoryModel _categoryModel = CategoryModel(
    types: '',
    image: [],
    categoryName: '',
    strPrice: 0,
  );

  CategoryModel get categoryModel => _categoryModel;
  void setCategoryModel(String categoryModel) {
    _categoryModel = CategoryModel.fromJson(categoryModel);
  }
}
