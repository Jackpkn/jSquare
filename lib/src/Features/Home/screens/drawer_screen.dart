// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jsquare/src/providers/user_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeDrawer extends StatelessWidget {
      HomeDrawer({super.key});
  void signOut() async {
   
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString('x-auth-token', '');
    Get.toNamed('login-screen');
   
  }
UserProvider userProvider = Get.put(UserProvider());
  @override
  Widget build(BuildContext context) {
 
    return Drawer(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Container(
              alignment: Alignment.topLeft,
              color: Colors.white,
              height: 90,
              padding: const EdgeInsets.only(top: 16, left: 10),
              child:   const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'WELCOME AMO YOU',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                  CircleAvatar(
                    radius: 18,
                  )
                ],
              ),
            ),
          ),
          ListTile(
            onTap: () {
              Get.toNamed('my-cart');
            },
            leading: const Icon(
              Icons.person,
              color: Colors.black,
              size: 28,
            ),
            title: const Text(
              'Your Profile',
              style: TextStyle(
                color: Color.fromRGBO(0, 0, 0, 1),
                fontSize: 24,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          ListTile(
            onTap: () {
              Get.toNamed('orders-page');
            },
            leading: const Icon(
              Icons.five_k_plus,
              color: Colors.black,
              size: 28,
            ),
            title: const Text(
              'Your Orders',
              style: TextStyle(
                color: Colors.black,
                fontSize: 24,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          ListTile(
            onTap: () {
              
              Get.toNamed('favourites-page');
            },
            leading: const Icon(
              Icons.favorite,
              color: Colors.black,
              size: 28,
            ),
            title: const Text(
              'Your Favourites',
              style: TextStyle(
                color: Colors.black,
                fontSize: 24,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          ListTile(
            onTap: () {
              // Get.toNamed('recommended-page');
              Get.back();
            },
            leading: const Icon(
              Icons.recommend_rounded,
              color: Colors.black,
              size: 28,
            ),
            title: const Text(' Recommendations for you',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.w400,
                )),
          ),
          ListTile(
            onTap: () {
              Get.toNamed('rating-reviews-page');
            },
            leading: const Icon(
              Icons.star,
              color: Colors.black,
              size: 28,
            ),
            title: const Text(
              'Your Rating and Reviews',
              style: TextStyle(
                color: Colors.black,
                fontSize: 24,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          ListTile(
            onTap: () {},
            leading: const Icon(
              Icons.policy,
              color: Colors.black,
              size: 28,
            ),
            title: const Text(
              'Term and Conditions',
              style: TextStyle(
                color: Colors.black,
                fontSize: 24,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          ListTile(
            onTap: () {},
            leading: const Icon(
              Icons.question_mark,
              color: Colors.black,
              size: 28,
            ),
            title: const Text(
              'Frequently Asked Questions',
              style: TextStyle(
                color: Colors.black,
                fontSize: 24,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          ListTile(
            onTap: () {},
            leading: const Icon(
              Icons.settings,
              color: Colors.black,
              size: 28,
            ),
            title: const Text(
              'Settings',
              style: TextStyle(
                color: Colors.black,
                fontSize: 24,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          ListTile(
            onTap: () {
              signOut();
            },
            leading: const Icon(
              Icons.logout,
              color: Colors.black,
              size: 28,
            ),
            title: const Text(
              'Logout',
              style: TextStyle(
                color: Colors.black,
                fontSize: 24,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
