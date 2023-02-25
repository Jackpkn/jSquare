import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jsquare/src/widgets/container.dart';

import '../../controller/icon_visible_controler.dart';
import '../../widgets/textfromfield.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  IconController iconController = Get.put(IconController());
  late bool isRemindMe = false;
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
                      controller: emailController,
                      hintText: 'Enter your Email',
                      labelText: 'Email',
                      validator: (p) {
                        return null;
                      },
                      onSaved: (value) {},
                    ),
                    const SizedBox(
                      height: 9,
                    ),
                    Obx(() => TextFormInput(
                          obscureText: iconController.isVisible.value,
                          icon: IconButton(
                            onPressed: () {
                              iconController.isVisible.value =
                                  !iconController.isVisible.value;
                            },
                            icon: Icon(
                              iconController.isVisible.value
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                            ),
                          ),
                          controller: passwordController,
                          hintText: 'Enter your password',
                          labelText: 'Password',
                          validator: (p) {
                            return null;
                          },
                          onSaved: (value) {},
                        )),
                    Align(
                      alignment: Alignment.topLeft,
                      child: TextButton(
                        onPressed: () {},
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
                      onTap: () {},
                      child: GlobalContainer(
                        height: 56,
                        width: MediaQuery.of(context).size.width,
                        borderWidth: 1.0,
                        radius: 10,
                        color: const Color.fromARGB(255, 255, 67, 54),
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
                      onTap: () {},
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
                        color: Colors.blue,
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
                                    print('JACK');
                                  },
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(
                                    255,
                                    4,
                                    119,
                                    213,
                                  ),
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
    );
  }
}
