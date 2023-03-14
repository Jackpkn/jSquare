// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:jsquare/src/GlobalWidgets/container.dart';

import '../../../GlobalWidgets/textfromfield.dart';

class ProfilePage extends StatelessWidget {
  static const String routeName = 'profile-page';
  ProfilePage({super.key});

  TextEditingController nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
          TextFormInput(
            hintText: 'Name',
            labelText: 'First Name',
            obscureText: false,
            maxLines: 1,
            controller: nameController,
            validator: (value) {
              return null;
            },
          ),
          const SizedBox(
            height: 15,
          ),
          TextFormInput(
            hintText: 'Email',
            labelText: 'Email',
            obscureText: false,
            maxLines: 1,
            controller: nameController,
            validator: (value) {
              return null;
            },
          ),
          const SizedBox(
            height: 15,
          ),
          TextFormInput(
            hintText: 'Username',
            labelText: 'username',
            obscureText: false,
            maxLines: 1,
            controller: nameController,
            validator: (value) {
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
            controller: nameController,
            validator: (value) {
              return null;
            },
          ),
          const SizedBox(
            height: 25,
          ),
          GlobalContainer(
            height: 50,
            width: MediaQuery.of(context).size.width * 0.96,
            borderWidth: 1,
            child: const Row(
              children: [
                Icon(Icons.edit),
                Text('Edit Profile'),
              ],
            ),
          )
        ],
      ),
    );
  }
}
