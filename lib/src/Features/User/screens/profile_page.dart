// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jsquare/src/Features/User/Services/user_services.dart';
import 'package:jsquare/src/GlobalWidgets/container.dart';
import 'package:jsquare/src/component/extension.dart';
import 'package:provider/provider.dart';

import '../../../GlobalWidgets/textfromfield.dart';
import '../../../models/user_models.dart';
import '../../../providers/user_provider.dart';

class ProfilePage extends StatelessWidget {
  static const String routeName = 'profile-page';
  ProfilePage({super.key});

  UserServices userServices = Get.put(UserServices());
  final _key = GlobalKey<FormState>();
  String? validateMobile(String value) {
    String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
    RegExp regExp = RegExp(pattern);
    if (value.isEmpty) {
      return 'Please enter mobile number';
    } else if (!regExp.hasMatch(value)) {
      return 'Please enter valid mobile number';
    }
    return null;
  }

  late User user;
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    TextEditingController nameController =
        TextEditingController(text: userProvider.user.name);
    TextEditingController emailController =
        TextEditingController(text: userProvider.user.email);
    TextEditingController userNameController =
        TextEditingController(text: userProvider.user.userName);
    TextEditingController mobileController =
        TextEditingController(text: userProvider.user.phone.toString());
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding:
              const EdgeInsets.only(left: 8, right: 8, top: 18, bottom: 10),
          child: Form(
            key: _key,
            child: Column(
              children: [
                Container(
                  height: 50,
                  width: double.infinity,
                  color: Colors.white,
                  child: const ListTile(
                    title: Text(
                      'Your Profile',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 24,
                      ),
                    ),
                    leading: Icon(
                      Icons.person,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormInput(
                  hintText: 'Name',
                  labelText: 'first Name',
                  obscureText: false,
                  maxLines: 1,
                  controller: nameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "This field can't be empty";
                    }
                    // else if (!value.isValidPhone) {
                    //   return "Please enter valid phone";
                    // }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 12,
                ),
                TextFormInput(
                  hintText: 'Email',
                  labelText: 'Enter email',
                  obscureText: false,
                  maxLines: 1,
                  controller: emailController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "This field can't be empty";
                    }
                    // else if (!value.isValidPhone) {
                    //   return "Please enter valid phone";
                    // }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 12,
                ),
                TextFormInput(
                  hintText: 'Username',
                  labelText: 'username',
                  obscureText: false,
                  maxLines: 1,
                  controller: userNameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "This field can't be empty";
                    }
                    // else if (!value.isValidPhone) {
                    //   return "Please enter valid phone";
                    // }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormInput(
                  hintText: 'Mobile Number',
                  labelText: 'Mobile Number',
                  obscureText: false,
                  maxLines: 1,
                  controller: mobileController,
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
                  height: 25,
                ),
                GestureDetector(
                  onTap: () {
                    if (_key.currentState!.validate()) {
                      userServices.updateProfile(
                          name: userProvider.user.name,
                          email: emailController.text.trim(),
                          userName: userNameController.text.trim(),
                          phone: int.parse(mobileController.text),
                          context: context);
                    }
                  },
                  child: GlobalContainer(
                    radius: 10,
                    height: 50,
                    color: Colors.red,
                    width: MediaQuery.of(context).size.width * 0.96,
                    borderWidth: 1,
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.edit),
                        SizedBox(
                          width: 14,
                        ),
                        Text(
                          'Edit Profile',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
