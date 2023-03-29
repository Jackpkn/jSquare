import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddressController extends GetxController{

 AddressController get instance => Get.find();


   final TextEditingController firstNameController = TextEditingController();
  final TextEditingController middleController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController addressLine1Controller = TextEditingController();
  final TextEditingController addressLine2Controller = TextEditingController();
  final TextEditingController addressLine3Controller = TextEditingController();
  final TextEditingController postalCodeController = TextEditingController();
  final TextEditingController localityController = TextEditingController();
  final TextEditingController landmarkController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController aadhaarNumberController = TextEditingController();
  final TextEditingController panNumberController = TextEditingController();

  @override
  void dispose() {
     firstNameController.dispose();
     middleController.dispose();
     lastNameController.dispose();
     addressLine1Controller.dispose();
     addressLine2Controller.dispose();
     addressLine3Controller.dispose();
     postalCodeController.dispose();
     localityController.dispose();
     mobileController.dispose();
     landmarkController.dispose();
    middleController.dispose();
    emailController.dispose();
    aadhaarNumberController.dispose();
    panNumberController.dispose();
    super.dispose();
  }

  
}