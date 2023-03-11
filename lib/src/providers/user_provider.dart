import 'package:get/get.dart';
import 'package:jsquare/src/models/user_models.dart';

// class UserProvider extends ChangeNotifier {
//     User _user = User(
//     id: '',
//     name: '',
//     email: '',
//     password: '',
//     address: '',
//     type: '',
//     token: '',
//     cart: [],
//   );
//   User get user => _user;
//   void setUser(String user) {
//     _user = User.fromJson(user);
//     notifyListeners();
//   }
// }

class UserProvider extends GetxController {
  User _user = User(
    id: '',
    name: '',
    email: '',
    password: '',
    address: '',
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
}
