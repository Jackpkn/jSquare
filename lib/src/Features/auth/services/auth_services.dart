import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'package:jsquare/src/constants/httperror_handling.dart';
import 'package:jsquare/src/models/user_models.dart';
import 'package:http/http.dart' as http;
import 'package:jsquare/src/providers/user_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Home/screens/home_page.dart';
import '../constant/constant.dart';

class AuthService extends GetxController {
  static AuthService get instance => Get.find();

  // String url = Config.url;
  // 10.2.100.41
  Rxn<User> user = Rxn<User>();
  final baseUrl = 'http://10.2.100.41:3000/auth/signUp';

  Future<dynamic> signUp({
    required String name,
    required String password,
    required String email,
    required String userName,
    required int phone,
  }) async {
    try {
      User user = User(
        id: '',
        name: name,
        email: email,
        userName: userName,
        password: password,
        phone: phone,
        image: '',
        address: [],
        wishlist: [],
        type: '',
        token: '',
        cart: [],
      );
      EasyLoading.show(
        status: 'Loading...',
        dismissOnTap: false,
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

      httpErrorHandle(
        response: response,
        onSuccess: () {
          if (response.statusCode == 200) {
            EasyLoading.showSuccess('Welcome AMO You');
            Navigator.of(Get.overlayContext!);
          } else {
            EasyLoading.showError('Something Wrong. Try again');
          }
        },
      );
    } catch (e) {
      EasyLoading.showError('Something wrong. Try again!');
    } finally {
      EasyLoading.dismiss();
    }
  }

  Future<void> loginUser({
    required String email,
    required String password,
  }) async {
    Get.put(UserProvider());
    try {
      EasyLoading.show(
        status: 'Loading...',
        dismissOnTap: false,
      );
      // Map<String, dynamic> token;
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
      debugPrint(response.body);
      httpErrorHandle(
        response: response,
        onSuccess: () async {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          Get.find<UserProvider>().setUser(response.body);
          await prefs.setString(
              'x-auth-token', jsonDecode(response.body)['token']);

          EasyLoading.showSuccess('WelCome to AMO YOU');

          Get.to(const IntroPage());
        },
      );
    } catch (e) {
      debugPrint(e.toString());
      EasyLoading.showError('Something wrong. Try again!');
    }
  }

  void signOut() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString('x-auth-token', '');
  }

  Future getUser() async {
    try {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      String? token = preferences.getString('x-auth-token');
      if (token == null) {
        preferences.setString('x-auth-token', '');
      }

      const tokenIsValid = 'http://10.2.100.41:3000/auth/tokenValid';
      var tokenRes = await http.post(
        Uri.parse(tokenIsValid),
        headers: <String, String>{
          'Content-type': 'application/json; charset=UTF-8',
          'x-auth-token': token!,
        },
      );
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
      EasyLoading.showError('Something went wrong. Try again!');
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
    http.Response response = await http.post(
      url,
      body: jsonEncode(
        {
          'idToken': idToken,
        },
      ),
      headers: <String, String>{
        'Content-type': 'application/json',
      },
    );
    final responseData = jsonDecode(response.body);

    token0 = responseData['token'];
    debugPrint(token0);
    Get.to(const IntroPage());
  }
}
// first we create instance for
// usr auth service get instance => Get.find()
//
