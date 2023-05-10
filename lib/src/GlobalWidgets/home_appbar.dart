// ignore_for_file: avoid_unnecessary_containers

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jsquare/src/GlobalWidgets/search_screen.dart';
import 'package:jsquare/src/providers/user_provider.dart';
import 'package:badges/badges.dart' as badges;
import 'package:provider/provider.dart';

import '../controller/icon_visible_controller.dart';

PreferredSizeWidget appbar({required BuildContext context}) {
  final userProvider = Provider.of<UserProvider>(context, listen: false);
  var cartLen = userProvider.user.cart.length;
  return AppBar(
    // backgroundColor: const Color.fromRGBO(248, 248, 248, 1),
    flexibleSpace: Padding(
      padding: const EdgeInsets.only(
        right: 4,
        top: 3,
        left: 4,
      ),
      child: Container(
        // color: Colors.pink,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                // IconButton(
                //   onPressed: () {
                //     // Get.to(const HomeDrawer(),
                //         // transition: Transition.leftToRight);
                //   },
                //   icon: const Icon(Icons.menu),
                //   iconSize: 28,
                //   color: const Color.fromRGBO(0, 0, 0, 1),
                // ),
                const SizedBox(
                  width: 40,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 3),
                  child: IconButton(
                    onPressed: () {
                      Get.to(
                        const SearchScreen(),
                        transition: Transition.leftToRight,
                        duration: const Duration(
                          microseconds: 200,
                        ),
                      );
                    },
                    icon: const Icon(Icons.search),
                    iconSize: 28,
                    // color: const Color.fromRGBO(0, 0, 0, 1),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.toNamed('my-cart');
                  },
                  child: badges.Badge(
                    position: badges.BadgePosition.topEnd(top: -19, end: -12),
                    showBadge: true,
                    ignorePointer: false,
                    badgeStyle: const badges.BadgeStyle(
                      shape: badges.BadgeShape.circle,
                      // badgeColor: Colors.white,
                      padding: EdgeInsets.all(5),
                      // borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                        // color: Colors.white,
                        width: 2,
                      ),

                      elevation: 0,
                    ),
                    badgeContent: Text(cartLen.toString()),
                    child: const Icon(
                      Icons.shopping_cart_outlined,
                      size: 30,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 17,
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(const UserDetails());
                  },
                  child: const CircleAvatar(
                    radius: 16,
                    backgroundColor: Colors.black,
                    child: Text('J'),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
// DSA a

class UserDetails extends StatelessWidget {
  const UserDetails({super.key});

  @override
  Widget build(BuildContext context) {
    // final userProvider = Provider.of<ImageController>(context, listen: false);
    return Scaffold(
      body: ChangeNotifierProvider<ImageController>(
        create: (context) => ImageController(),
        child: Consumer<ImageController>(builder: (context, viewModel, child) {
          return Center(
            child: Column(
              children: [
                if (viewModel.image != null)
                  Image.file(
                    viewModel.image,
                    height: 200,
                    width: 200,
                  ),
                ElevatedButton(
                  onPressed: () async {
                    final ImagePicker picker = ImagePicker();
                    final XFile? pickImage =
                        await picker.pickImage(source: ImageSource.camera);
                    if (pickImage != null) {
                      viewModel.setImage(File(pickImage.path));
                    }
                  },
                  child: const Text('select image '),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
