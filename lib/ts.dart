import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:jsquare/src/Features/Home/screens/home_page.dart';
import 'package:jsquare/src/constants/httperror_handling.dart';
import 'package:jsquare/src/providers/user_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProductController extends GetxController {
  Future getProduct() async {
    try {
      var url = Uri.parse('http://localhost:3000/admin/get-product');
      http.Response response = await http.get(
        url,
        headers: <String, String>{
          'Content-type': 'application/json; charset=UTF-8',
        },
      );
      if (response.statusCode == 200) {
        debugPrint(jsonEncode(response.body));
      } else if (response.statusCode == 404) {
        debugPrint('404');
      } else if (response.statusCode == 500) {
        debugPrint('something bad happened');
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future login({required String email, required String password}) async {
    try {
      var url = Uri.parse('http://localhost:3000/auth/login');
      http.Response response = await http.post(
        url,
        headers: <String, String>{
          'Content-type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(
          {
            'email': email,
            'password': password,
          },
        ),
      );
      if (response.statusCode == 200) {
        debugPrint((response.body));
      } else if (response.statusCode == 404) {
        debugPrint('404');
      } else if (response.statusCode == 500) {
        debugPrint('something bad happened');
      }
    } catch (e) {
      debugPrint(e.toString());
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
        headers: {
          'Content-type': 'application/json; charset=UTF-8',
        },
      );
      // debugPrint(response.body);
      //  if (response.statusCode == 200) {
      //   debugPrint((response.body));
      // } else if (response.statusCode == 404) {
      //   debugPrint('404');
      // } else if (response.statusCode == 500) {
      //   debugPrint('something bad happened');
      // }
      httpErrorHandle(
        response: response,
        onSuccess: () async {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          Get.find<UserProvider>().setUser(response.body);
          await prefs.setString(
              'x-auth-token', jsonDecode(response.body)['token']);

          // EasyLoading.showSuccess('WelCome to AMO YOU');

          Get.to(const IntroPage());
        },
      );
    } catch (e) {
      debugPrint(e.toString());
      EasyLoading.showError('Something wrong. Try again!');
    }
  }

}


// import 'dart:async';
// 
// import 'package:amazon_s3_cognito/amazon_s3_cognito.dart';

// Future<String> uploadToAWS(File imageFile) async {
//   final credentials = new CognitoCredentials(
//       'IDENTITY_POOL_ID', // identity pool ID
//       'ROLE_ARN' // authenticated role ARN
//   );
//   final s3Endpoint = 's3.ENDPOINT.amazonaws.com'; // replace ENDPOINT with your bucket's endpoint
//   final bucketName = 'BUCKET_NAME';
//   final region = 'REGION'; // your preferred region
//   final fileName = '${DateTime.now().millisecondsSinceEpoch}.jpg'; // optional: use a unique file name

//   final fileStream = imageFile.openRead();

//   try {
//     final s3 = new AmazonS3Cognito(credentials, s3Endpoint, region: region);

//     await s3.putObject(
//       bucketName,
//       fileName,
//       fileStream,
//       await imageFile.length(),
//       contentType: ContentType.parse('image/jpeg'),
//     );

//     final url = s3.getDirectUrl(bucketName, fileName,);
//     return url.toString();
//   } catch (e) {
//     print('Error uploading to S3: $e');
//     return null;
//   }
// }
