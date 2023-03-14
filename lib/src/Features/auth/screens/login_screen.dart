// ignore_for_file: must_be_immutable

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jsquare/src/Features/auth/Auth_controller/logincontroller.dart';
import 'package:jsquare/src/Features/auth/services/auth_services.dart';
import 'package:jsquare/src/GlobalWidgets/container.dart';

import '../../../controller/icon_visible_controller.dart';
import '../../../GlobalWidgets/textfromfield.dart';

class LoginScreen extends StatelessWidget {
  static const String routeName = 'login-screen';
  LoginScreen({super.key});

  final loginController = Get.lazyPut(() => LoginController(), fenix: true);

  final iconController = Get.lazyPut(() => IconController(), fenix: true);

  bool isRemindMe = true;
  final _key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Form(
                  key: _key,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 70,
                        child: Icon(
                          Icons.apple,
                          size: 55,
                        ),
                      ),
                      const Text(
                        'AmoYou my friend !!!',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 38,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormInput(
                        obscureText: false,
                        icon: null,
                        // controller:
                        //     Get.find<SignUpController>().emailController,
                        controller: Get.find<LoginController>().emailController,
                        // controller: emailController,
                        hintText: 'Enter your name',
                        labelText: 'Email',
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Obx(
                        () => TextFormInput(
                          obscureText:
                              Get.find<IconController>().isVisible.value,
                          icon: IconButton(
                            onPressed: () {
                              Get.find<IconController>().isVisible.value =
                                  !Get.find<IconController>().isVisible.value;
                            },
                            icon: Icon(
                              Get.find<IconController>().isVisible.value
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                            ),
                          ),
                          // controller:
                          //     Get.find<SignUpController>().passwordController,
                          controller:
                              Get.find<LoginController>().passwordController,
                          hintText: 'Enter your password',
                          labelText: 'Password',
                        ),
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: TextButton(
                          onPressed: () {
                            Get.toNamed('forgot-screen');
                          },
                          child: const Text(
                            'Forgot your password?',
                            style: TextStyle(
                              fontSize: 16,
                              color: Color.fromARGB(255, 29, 99, 156),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Checkbox(
                            value: isRemindMe,
                            onChanged: (value) {},
                          ),
                          const Text(
                            'Reminder me',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      GestureDetector(
                        onTap: () {
                          if (_key.currentState!.validate()) {
                            final controller = Get.find<LoginController>();
                            controller.loginUser(
                              email: controller.emailController.text.trim(),
                              password:
                                  controller.passwordController.text.trim(),
                            );
                             
                          }
                        },
                        child: GlobalContainer(
                          height: 56,
                          width: MediaQuery.of(context).size.width,
                          borderWidth: 1.0,
                          radius: 10,
                          color: const Color.fromRGBO(206, 41, 41, 1),
                          child: const Text(
                            'Log In',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 58,
                        child: Center(
                            child: Text(
                          'OR',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                          ),
                        )),
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.find<AuthService>().googleSign();
                        },
                        child: GlobalContainer(
                          height: 56,
                          width: MediaQuery.of(context).size.width,
                          borderWidth: 1.0,
                          radius: 10,
                          color: Colors.white,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/images/google.png',
                                width: 30,
                              ),
                              const SizedBox(
                                width: 30,
                              ),
                              const Padding(
                                padding: EdgeInsets.only(right: 90),
                                child: Text(
                                  'Continue with Google',
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 9,
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: GlobalContainer(
                          height: 56,
                          width: MediaQuery.of(context).size.width,
                          borderWidth: 1.0,
                          radius: 10,
                          color: const Color.fromRGBO(255, 255, 255, 1),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/images/facebook.png',
                                width: 30,
                              ),
                              const SizedBox(
                                width: 30,
                              ),
                              const Padding(
                                padding: EdgeInsets.only(right: 73),
                                child: Text(
                                  'Continue with Facebook',
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'Not on AmoYou yet? ',
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 16),
                              children: [
                                TextSpan(
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      Get.toNamed('signup');
                                    },
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue,
                                  ),
                                  text: 'Sign up  ',
                                  children: const [
                                    TextSpan(
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black,
                                      ),
                                      text: 'now',
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
