import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'package:jsquare/src/constants/httperror_handling.dart';
import 'package:jsquare/src/models/user_models.dart';
import 'package:http/http.dart' as http;
import 'package:jsquare/src/providers/user_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Home/screens/home_page.dart';
import '../../products/produst_page.dart';
import '../constant/constant.dart';

class AuthService extends GetxController {
  static AuthService get instance => Get.find();
  // 10.2.100.41
  final baseUrl = 'http://10.2.100.41:3000/auth/signUp';

  Future<void>? signUp({
    required String password,
    required String email,
  }) async {
    try {
      User user = User(
        id: '',
        name: '',
        email: email,
        password: password,
        address: '',
        type: '',
        token: '',
        cart: [],
      );
      
      final url = Uri.parse('http://10.2.100.41:3000/auth/signUp');
      http.Response response = await http.post(
        url,
        body: user.toJson(),
        encoding: const Utf8Codec(),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Accept': "*/*",
          'connection': 'keep-alive',
          'Accept-Encoding': 'gzip, deflate, br',
        },
      );
      // debugPrint(response as String?);
      if (response.statusCode == 200) {
        debugPrint('success');
        Get.to(const IntroPage());
      } else if (response.statusCode == 400) {
        debugPrint('email already exit');
        Get.to(const IntroPage());
      } else {
        debugPrint('some error found');
      }
      // httpErrorHandle(
      //   response: response,
      //   onSuccess: () {
      //     Get.showSnackbar(
      //       const GetSnackBar(
      //         message: 'Account created successfully! Now login the account',
      //       ),
      //     );
      //   },
      // );
    } catch (e) {
      Get.showSnackbar(
        GetSnackBar(
          message: e.toString(),
        ),
      );
    }
  }

  Future<void> loginUser({
    required String email,
    required String password,
  }) async {
    Get.put(UserProvider());
    try {
      Map<String, dynamic> token;
      const loginUrl = 'http://10.2.100.41:3000/auth/login';
      final url = Uri.parse(loginUrl);
      http.Response response = await http.post(
        url,
        body: jsonEncode(
          {
            'email': email,
            'password': password,
          },
        ),
        headers: <String, String>{
          'Content-type': 'application/json; charset=UTF-8',
        },
      );
      print(response.body);
      httpErrorHandle(
        response: response,
        onSuccess: () async {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          Get.find<UserProvider>().setUser(response.body);
          await prefs.setString(
              'x-auth-token', jsonDecode(response.body)['token']);
          Get.to(
            ProductPage(),
          );
        },
      );
    } catch (e) {
      Get.showSnackbar(GetSnackBar(
        message: e.toString(),
      ));
    }
  }

  Future getUser() async {
    try {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      String? token = preferences.getString('x-auth-token');
      if (token == null) {
        preferences.setString('x-auth-token', '');
      }
      const tokenIsValid = 'http://10.2.100.41:3000/auth/tokenValid';
      var tokenRes =
          await http.post(Uri.parse(tokenIsValid), headers: <String, String>{
        'Content-type': 'application/json; charset=UTF-8',
        'x-auth-token': token!,
      });
      var response = jsonDecode(tokenRes.body);
      if (response == true) {
        const getUser = 'http://10.2.100.41:3000/auth/getUser';
        http.Response userRes =
            await http.get(Uri.parse(getUser), headers: <String, String>{
          'Content-type': 'application/json; charset=UTF-8',
          'x-auth-token': token,
        });
        //! initialize user provider
        var userProvider = Get.put(UserProvider());
        userProvider.setUser(userRes.body);
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> googleSign() async {
    String token0;
    final GoogleSignIn googleSignIn = GoogleSignIn();
    final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

    final GoogleSignInAuthentication googleAuth =
        await googleUser!.authentication;

    final idToken = googleAuth.idToken;

    final url = Uri.parse('$googleUrl/auth/google-sign');
    http.Response response = await http.post(url,
        body: jsonEncode({'idToken': idToken}),
        headers: <String, String>{
          'Content-type': 'application/json; charset UTF-8'
        });
    final responseData = jsonDecode(response.body);

    token0 = responseData['token'];
    debugPrint(token0);
    Get.to(const IntroPage());
  }
}
// first we create instance for
// usr auth service get instance => Get.find()
//
