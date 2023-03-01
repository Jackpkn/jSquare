import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../services/auth_services.dart';

class SignUpController extends GetxController {
  // AuthService authService = Get.put(AuthService());
  final auth = Get.lazyPut(() => AuthService());
  static SignUpController get instance => Get.find();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  
  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }



  void signUpUser(
    String name,
    String email,
    String password,
  ) {
    final a = Get.find<AuthService>();
    a.signUp(
      email: email,
      password: password,
    );
  }
}
