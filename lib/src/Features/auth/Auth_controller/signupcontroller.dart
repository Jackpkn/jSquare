import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../services/auth_services.dart';

class SignUpController extends GetxController {
  // AuthService authService = Get.put(AuthService());
  final auth = Get.lazyPut(() => AuthService());
  static SignUpController get instance => Get.find();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController secondNameController = TextEditingController();
  TextEditingController emailNameController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController mobileNameController = TextEditingController();
  TextEditingController passwordNameController = TextEditingController();
// initState => onInit
// dispose = >
  @override
  void dispose() {
    firstNameController.dispose();
    secondNameController.dispose();
    emailNameController.dispose();
    userNameController.dispose();
    userNameController.dispose();
    mobileNameController.dispose();
    passwordNameController.dispose();

    super.dispose();
  }

  void signUpUser(
    String name,
    String email,
    String userName,
    String mobileNumber,
    String password,
  ) {
    final a = Get.find<AuthService>();
    a.signUp(
      name: name,
      email: email,
      password: password,
    );
  }
}

// Map<STRING, Map<String, dynamic> > get {
// 'get': {
//  'home' : " json",
//
// }}
 
 