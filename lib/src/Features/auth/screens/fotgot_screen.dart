import 'package:flutter/material.dart';

import '../../../GlobalWidgets/container.dart';
import '../../../GlobalWidgets/textfromfield.dart';

class ForgotScreen extends StatelessWidget {
  static const String routeName = 'forgot-screen';
  ForgotScreen({super.key});
  TextEditingController mobileNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  'assets/images/forgot.png',
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.55,
                ),
                const Text(
                  'Forgot',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 20,
                  ),
                ),
                const Text(
                  'Password?',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Don't worry! it happens. Please enter the phone ",
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
                const Text(
                  " number we will send the OTP on this numbers ...",
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(
                  height: 14,
                ),
                TextFormInput(
                  maxLines: 1,
                  obscureText: true,
                  hintText: 'Enter your mobile number',
                  labelText: 'Mobile Number',
                  controller: mobileNumberController,
                ),
                const SizedBox(
                  height: 19,
                ),
                GestureDetector(
                  onTap: () {},
                  child: GlobalContainer(
                    height: 56,
                    width: MediaQuery.of(context).size.width,
                    borderWidth: 1.0,
                    radius: 10,
                    color: const Color.fromRGBO(206, 41, 41, 1),
                    child: const Text(
                      'Continue',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
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
