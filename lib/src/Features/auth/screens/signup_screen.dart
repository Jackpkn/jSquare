// ignore_for_file: must_be_immutable

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:jsquare/src/GlobalWidgets/textfromfield.dart';
import 'package:jsquare/src/component/extension.dart';

import '../../../GlobalWidgets/container.dart';
import '../../../controller/icon_visible_controller.dart';
import '../services/auth_services.dart';

class SignUpScreen extends StatelessWidget {
  static const String routeName = 'signup';
  SignUpScreen({super.key});
  TextEditingController firstNameController = TextEditingController();
  TextEditingController secondNameController = TextEditingController();
  TextEditingController emailNameController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController mobileNameController = TextEditingController();
  TextEditingController passwordNameController = TextEditingController();

  bool isRemindMe = true;
  final iconController = Get.lazyPut(() => IconController(), fenix: true);
  final AuthService authService = Get.put(AuthService());

  final signUpKEY = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding:
              const EdgeInsets.only(left: 8, right: 8, top: 12, bottom: 18),
          child: Form(
            key: signUpKEY,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Sign Up',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 34),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormInput(
                  maxLines: 1,
                  obscureText: false,
                  hintText: 'Enter first Name',
                  labelText: 'First Name',
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "This field can't be empty";
                    }
                    return null;
                  },
                  controller: firstNameController,
                ),
                const SizedBox(
                  width: 4,
                ),
                const SizedBox(
                  height: 8,
                ),
                TextFormInput(
                  maxLines: 1,
                  obscureText: false,
                  hintText: 'Enter your email',
                  labelText: 'Email',
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "This field can't be empty";
                    } else if (!value.isValidEmail) {
                      return "Please enter valid email";
                    }
                    return null;
                  },
                  controller: emailNameController,
                ),
                const SizedBox(
                  height: 8,
                ),
                TextFormInput(
                  maxLines: 1,
                  obscureText: true,
                  hintText: 'Enter your Name',
                  labelText: 'UserName',
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "This field can't be empty";
                    }
                    return null;
                  },
                  controller: userNameController,
                ),
                const SizedBox(
                  height: 8,
                ),
                TextFormInput(
                  maxLines: 1,
                  obscureText: false,
                  hintText: 'Enter your mobile number',
                  labelText: 'Mobile Number',
                  controller: mobileNameController,
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "This field can't be empty";
                    } else if (!value.isValidPhone) {
                      return "Please enter valid phone";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 8,
                ),
                Obx(
                  () => TextFormInput(
                    obscureText: Get.find<IconController>().isVisible.value,
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
                    controller: passwordNameController,
                    validator: (String? value) {
                      List<String> validation = [];
                      if (value == null || value.isEmpty) {
                        return 'This field can not be empty';
                      } else {
                        if (!value.isValidPasswordHasNumber) {
                          validation.add('Must contain 1 Number');
                        }
                        if (!value.isValidPasswordHasCapitalLetter) {
                          validation.add("Must contain 1 capital letter");
                        }
                        if (!value.isValidPasswordHasLowerCaseLetter) {
                          validation.add("Must contain 1 simple letter");
                        }
                        if (!value.isValidPasswordHasSpecialCharacter) {
                          validation.add(
                              "Must contain 1 special character[! @ # \$ %]");
                        }
                      }
                      String msg = '';
                      if (validation.isNotEmpty) {
                        for (var i = 0; i < validation.length; i++) {
                          msg = msg + validation[i];
                          if ((i + 1) != validation.length) {
                            msg = "$msg\n";
                          }
                        }
                      }
                      return msg.isNotEmpty ? msg : null;
                    },
                    hintText: 'Enter your password',
                    labelText: 'Password',
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Checkbox(
                      value: isRemindMe,
                      onChanged: (value) {},
                    ),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Term and Conditions   ',
                            recognizer: TapGestureRecognizer()..onTap = () {},
                            style: const TextStyle(
                              color: Colors.blue,
                            ),
                            children: const [
                              TextSpan(
                                text: 'And',
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ],
                        text: 'I agree to your   ',
                        style: const TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () {},
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 45),
                    child: Text(
                      'Privacy Policy',
                      style: TextStyle(color: Colors.blue, fontSize: 15),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                GestureDetector(
                  onTap: () {
                    EasyLoading.show(status: 'Loading ..');
                    if (signUpKEY.currentState!.validate()) {
                      authService.signUp(
                        name: firstNameController.text.trim(),
                        password: passwordNameController.text.trim(),
                        userName: userNameController.text.trim(),
                        email: emailNameController.text.trim(),
                        phone: int.parse(mobileNameController.text),
                        context: context,
                      );
                    }
                    // EasyLoading.dismiss();
                    // if (auth == null) {
                    //   EasyLoading.showError(
                    //       'Something wrong. Please Try again!');
                    // }
                    // EasyLoading.showSuccess('Welcome back');
                  },
                  child: GlobalContainer(
                    height: 56,
                    width: MediaQuery.of(context).size.width,
                    borderWidth: 1.0,
                    radius: 10,
                    color: const Color.fromRGBO(206, 41, 41, 1),
                    child: const Text(
                      'Sign Up',
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
                        Logo(Logos.google),
                        // Image.asset(
                        //   'assets/images/google.png',
                        //   width: 30,
                        // ),
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
                  height: 8,
                ),
                GestureDetector(
                  onTap: () {},
                  child: GlobalContainer(
                    height: 56,
                    width: MediaQuery.of(context).size.width,
                    borderWidth: 1.0,
                    radius: 10,
                    color: const Color.fromARGB(255, 40, 100, 184),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Logo(Logos.facebook_f),
                        // Image.asset(
                        //   'assets/images/facebook.png',
                        //   width: 30,
                        // ),
                        const SizedBox(
                          width: 30,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(right: 73),
                          child: Text(
                            'Continue with Facebook',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 8,
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
                        Logo(Logos.apple),
                        const SizedBox(
                          width: 30,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(right: 73),
                          child: Text(
                            'Continue with Apple',
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
                Align(
                  alignment: Alignment.center,
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Already have an account? ',
                          style: const TextStyle(
                              color: Colors.black, fontSize: 16),
                          children: [
                            TextSpan(
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Get.toNamed('login-screen');
                                },
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.blue,
                              ),
                              text: 'Sign in',
                              children: const [
                                TextSpan(
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black,
                                  ),
                                  text: ' now',
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
