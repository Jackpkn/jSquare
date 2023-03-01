import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jsquare/src/Features/auth/services/auth_services.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();
  final authService = Get.lazyPut(() => AuthService());
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  Future<void> loginUser(
      {required String email, required String password}) async {
    Get.find<AuthService>().loginUser(email: email, password: password);
  }
}
