
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:jsquare/src/providers/user_provider.dart';
import '../../../constants/httperror_handling.dart';
import '../../../models/kycmodel.dart';

class AddressServices extends GetxController {
  AddressServices get instance => Get.find();
  UserProvider userProvider = Get.put(UserProvider());
  Future<void> saveUserAddress({
    required String firstName,
    required String middleName,
    required String lastName,
    required String addressLine1,
    required String addressLine2,
    required String addressLine3,
    required String postalCode ,
    required String landmark,
    required String locality,
    required String mobileNumber,
    required String emailAddress,
    required String aadhaarNumber,
    required String panCardNumber,
  }) async {
    try {
      KycModel kycModel = KycModel(
        firstName: firstName,
        middleName: middleName,
        lastName: lastName,
        addressLine1: addressLine1,
        addressLine2: addressLine2,
        addressLine3: addressLine3,
        postalCode: postalCode,
        landmark: landmark,
        locality: locality,
        mobileNumber: mobileNumber,
        emailAddress: emailAddress,
        aadhaarNumber: aadhaarNumber,
        panCardNumber: panCardNumber,
      );

      http.Response response = await http.post(
        Uri.parse('http://localhost:3000/auth/save-user-address'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': userProvider.user.token,
        },
        body: kycModel.toJson(),
      );
      httpErrorHandle(
        response: response,
        onSuccess: () {
          // User user = userProvider.user.copyWith(
          //   address: jsonDecode(response.body)['address'],
          // );
          // userProvider.setUserFromModel(user);

          EasyLoading.showSuccess('Successfully saved your address');
        },
      );
    } catch (e) {
      debugPrint(e.toString());
      EasyLoading.showError(e.toString());
    }
  }
}
