import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

import '../../../GlobalWidgets/container.dart';

class OtpScreen extends StatelessWidget {
  static const String routeName = 'otp-screen';
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/otp.png',
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.56,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'OTP VERIFICATION',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  RichText(
                    text: TextSpan(
                      text: "Enter the OTP sent to ?  ",
                      style: const TextStyle(
                          color: Color.fromARGB(255, 47, 40, 40)),
                      children: [
                        TextSpan(
                          text: '+91-8976500001',
                          recognizer: TapGestureRecognizer()..onTap = () {},
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  OtpTextField(
                    numberOfFields: 4,
                    borderColor: Colors.black,
                    focusedBorderColor: Colors.green,
                    styles: const [
                      TextStyle(
                        color: Colors.black,
                      ),
                      TextStyle(
                        color: Colors.orange,
                      ),
                      TextStyle(
                        color: Colors.pink,
                      ),
                      TextStyle(
                        color: Colors.green,
                      )
                    ],
                    showFieldAsBox: true,
                    borderWidth: 2.0,
                    //runs when a code is typed in
                    onCodeChanged: (String code) {
                      //handle validation or checks here if necessary
                    },
                    //runs when every textfield is filled
                    onSubmit: (String verificationCode) {},
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text('0.0.120'),
                  const SizedBox(
                    height: 14,
                  ),
                  RichText(
                    text: TextSpan(
                      text: "Don't receive code ?  ",
                      style: const TextStyle(
                          color: Color.fromARGB(255, 47, 40, 40)),
                      children: [
                        TextSpan(
                            text: 'Re-Send',
                            recognizer: TapGestureRecognizer()..onTap = () {},
                            style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            )),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 40,
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
                        'Verify',
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
      ),
    );
  }
}
