import 'package:flutter/material.dart';
import 'package:jsquare/src/models/user_models.dart';

class UserProvider extends ChangeNotifier {
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
    notifyListeners();
  }

  void setUserFromModel(User user) {
    _user = user;
    notifyListeners();
  }
}
