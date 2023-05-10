// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:jsquare/src/Features/Admin/widgets/file_picker.dart';

import 'package:jsquare/src/constants/httperror_handling.dart';
import 'package:jsquare/src/controller/icon_visible_controller.dart';
import 'package:jsquare/src/models/user_models.dart';
import 'package:http/http.dart' as http;
import 'package:jsquare/src/providers/user_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Home/screens/home_page.dart';

class AuthService extends GetxController {
  static AuthService get instance => Get.find();

  // String url = Config.url;
  // 10.2.100.41
  Rxn<User> user = Rxn<User>();
  // final baseUrl = 'http://10.2.100.61:3000/auth/signUp';
  final baseUrl = 'http://localhost:3000/auth/signUp';

  Future<dynamic> signUp(
      {String? imageUrl,
      required String name,
      required String password,
      required String email,
      required String userName,
      required int phone,
      required BuildContext context}) async {
    try {
      final imageProvider =
          Provider.of<ImageController>(context, listen: false);
      final cloudinary = CloudinaryPublic('dznyxrzc6', 'nbscssgu');
      CloudinaryResponse res = await cloudinary.uploadFile(
        CloudinaryFile.fromFile(
          image!.path,
          folder: name,
        ),
      );
      imageProvider.image = res.secureUrl;
      User user = User(
        id: '',
        name: name,
        email: email,
        userName: userName,
        password: password,
        phone: phone,
        // image: '',
        image: imageProvider.image,
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
      // Map<String, dynamic> data = user.toMap();
      // this will convert object to map
      // var json = jsonEncode(data); // convert to json
      // final url = Uri.parse('http://10.2.100.61:3000/auth/signUp');
      final url = Uri.parse('http://localhost:3000/auth/signUp');
      http.Response response = await http.post(
        url,
        // body: user.toJson(),
        // object -> to Map - encode
        // body: json,
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
    required BuildContext context,
  }) async {
    Get.put(UserProvider());
    try {
      EasyLoading.show(
        status: 'Loading...',
        dismissOnTap: false,
      );
      // Map<String, dynamic> token;
      // const loginUrl = 'http://10.2.100.61:3000/auth/login';
      const loginUrl = 'http://localhost:3000/auth/login';
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
      // debugPrint(response.body);
      httpErrorHandle(
        response: response,
        onSuccess: () async {
          SharedPreferences prefs = await SharedPreferences.getInstance();

          // Get.find<UserProvider>().setUser(response.body);
          Provider.of<UserProvider>(context, listen: false)
              .setUser(response.body);
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
    // preferences.setString('x-auth-token', '');
    preferences.clear();
  }

  Future getUser({required BuildContext context}) async {
    try {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      String? token = preferences.getString('x-auth-token');
      if (token == null) {
        preferences.setString('x-auth-token', '');
      }

      // const tokenIsValid = 'http://10.2.100.61:3000/auth/tokenValid';
      const tokenIsValid = 'http://localhost:3000/auth/tokenValid';
      var tokenRes = await http.post(
        Uri.parse(tokenIsValid),
        headers: <String, String>{
          'Content-type': 'application/json; charset=UTF-8',
          'x-auth-token': token!,
        },
      );
      var response = jsonDecode(tokenRes.body);
      if (response == true) {
        // const getUser = 'http://10.2.100.61:3000/auth/getUser';
        const getUser = 'http://localhost:3000/auth/getUser';
        http.Response userRes =
            await http.get(Uri.parse(getUser), headers: <String, String>{
          'Content-type': 'application/json; charset=UTF-8',
          'x-auth-token': token,
        });
        //! initialize user provider
        // var userProvider = Get.put(UserProvider());
        var userProvider = Provider.of<UserProvider>(context, listen: false);

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

    final url = Uri.parse('http://10.2.100.61:3000/auth/getUser');
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

  Future<void> googleLogin() async {
    try {
      final GoogleSignIn googleSignIn = GoogleSignIn(scopes: ['email']);
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      final GoogleSignInAuthentication googleAuth =
          await googleUser!.authentication;

      var response = await http.post(
        Uri.parse('http://10.2.100.61:3000/api/auth/google-signin'),
        body: jsonEncode(
          {
            'idToken': googleAuth.idToken,
            'accessToken': googleAuth.accessToken,
          },
        ),
      );
      httpErrorHandle(
        response: response,
        onSuccess: () {
          debugPrint(response.body);
          debugPrint('SUCCESS');
        },
      );
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
// first we create instance for
// usr auth service get instance => Get.find()
//
