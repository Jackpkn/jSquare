// ignore_for_file: must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:jsquare/src/Features/Home/services/home_service_provider.dart';
import 'package:jsquare/src/GlobalWidgets/container.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeDrawer extends StatelessWidget {
  HomeDrawer({super.key});
  void signOut() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString('x-auth-token', '');
    Get.toNamed('login-screen');
  }

  // UserProvider userProvider = Get.put(UserProvider());
  CategoryProvider categoryProvider = Get.put(CategoryProvider());
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.black,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding:
                const EdgeInsets.only(top: 8, bottom: 2, right: 8, left: 8),
            child: GlobalContainer(
              width: MediaQuery.of(context).size.width,
              height: 49,
              color: const Color.fromARGB(255, 52, 25, 25),
              radius: 9,
              borderWidth: 4,

              // padding: const EdgeInsets.only(top: 16, left: 10),s
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'WELCOME AMO YOU',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Container(
                    height: 42,
                    width: 42,
                    margin: const EdgeInsets.only(right: 13.2),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color.fromARGB(221, 0, 0, 0),
                    ),
                    child: IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: const Icon(
                        color: Colors.white,
                        Icons.clear,
                        size: 19,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(top: 1, bottom: 2, right: 8, left: 8),
            child: GlobalContainer(
              height: 126,
              width: MediaQuery.of(context).size.width,
              borderWidth: 4,
              radius: 9,
              // color: const Color.fromARGB(255, 52, 34, 34),
              color: const Color.fromARGB(255, 42, 37, 37),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Row(
                    children: [
                      SizedBox(
                        width: 6,
                      ),
                      CircleAvatar(
                        minRadius: 35,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 17),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Pawan kumar bairwa',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600),
                            ),
                            Text(
                              '+91907962081',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600),
                            ),
                            Text(
                              'example@gmail.com',
                              style: TextStyle(
                                color: Color.fromARGB(255, 205, 179, 179),
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: 43,
                    width: 43,
                    margin: const EdgeInsets.only(right: 13),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color.fromARGB(221, 26, 15, 15),
                    ),
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.edit,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(top: 1, bottom: 2, right: 8, left: 8),
            child: GlobalContainer(
              height: 291,
              width: MediaQuery.of(context).size.width,
              borderWidth: 5,
              color: const Color.fromARGB(255, 42, 37, 37),
              radius: 9,
              child: Column(
                children: [
                  ListTile(
                    onTap: () {
                      Get.toNamed('profile-page');
                    },
                    leading: const Icon(
                      EvaIcons.person,
                      // color: Colors.red,
                      color: Colors.white,
                      size: 30,
                    ),
                    trailing: const TrailingIcon(),
                    title: const Text(
                      'Your Profile',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  ListTile(
                    onTap: () {
                      Get.toNamed('orders-page');
                    },
                    leading: const Icon(
                      EvaIcons.options,
                      color: Colors.white,
                      size: 28,
                    ),
                    trailing: const TrailingIcon(),
                    title: const Text(
                      'Your Orders',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  ListTile(
                    onTap: () {
                      Get.toNamed('favourites-page');
                    },
                    trailing: const TrailingIcon(),
                    leading: const Icon(
                      Icons.favorite,
                      color: Colors.white,
                      size: 28,
                    ),
                    title: const Text(
                      'Your Favourites',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  ListTile(
                    onTap: () {
                      // Get.toNamed('recommended-page');
                      Get.back();
                    },
                    trailing: const TrailingIcon(),
                    leading: const Icon(
                      Icons.recommend_rounded,
                      color: Colors.white,
                      size: 28,
                    ),
                    title: const Text(' Recommendations for you',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                        )),
                  ),
                  ListTile(
                    onTap: () {
                      Get.toNamed('rating-reviews-page');
                    },
                    trailing: const TrailingIcon(),
                    leading: const Icon(
                      Icons.star,
                      color: Colors.white,
                      size: 28,
                    ),
                    title: const Text(
                      'Your Rating and Reviews',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(top: 1, bottom: 2, right: 8, left: 8),
            child: GlobalContainer(
              height: 240,
              width: MediaQuery.of(context).size.width,
              borderWidth: 5, //170 + 135 = 305
              // color: const Color.fromARGB(255, 41, 18, 18),
              color: const Color.fromARGB(255, 42, 37, 37),
              radius: 9,
              child: Column(
                children: [
                  ListTile(
                    trailing: const TrailingIcon(),
                    onTap: () {},
                    leading: const Icon(
                      Icons.policy,
                      color: Colors.white,
                      size: 28,
                    ),
                    title: const Text(
                      'Term and Conditions',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  ListTile(
                    trailing: const TrailingIcon(),
                    onTap: () {},
                    leading: const Icon(
                      Icons.question_mark,
                      color: Colors.white,
                      size: 28,
                    ),
                    title: const Text(
                      'Frequently Asked Questions',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  ListTile(
                    trailing: const TrailingIcon(),
                    onTap: () {
                      // categoryProvider.fetchProduct();
                    },
                    leading: const Icon(
                      Icons.settings,
                      color: Colors.white,
                      size: 28,
                    ),
                    title: const Text(
                      'Settings',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  ListTile(
                    trailing: const TrailingIcon(),
                    onTap: () {
                      signOut();
                    },
                    leading: const Icon(
                      Icons.logout,
                      color: Colors.white,
                      size: 28,
                    ),
                    title: const Text(
                      'Logout',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class TrailingIcon extends StatelessWidget {
  const TrailingIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: 30,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Color.fromARGB(221, 26, 15, 15),
      ),
      child: const Icon(
        CupertinoIcons.forward,
        color: Colors.white,
      ),
    );
  }
}
