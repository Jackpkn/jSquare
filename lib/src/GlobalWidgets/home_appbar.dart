import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jsquare/src/providers/user_provider.dart';
import 'package:badges/badges.dart' as badges;

PreferredSizeWidget appbar() {
  UserProvider userProvider = Get.put(UserProvider());
  var cartLen = userProvider.user.cart.length;
  return AppBar(
    backgroundColor: const Color.fromRGBO(248, 248, 248, 1),
    flexibleSpace: Padding(
      padding: const EdgeInsets.only(
        right: 4,
        top: 3,
        left: 4,
      ),
      child: Container(
        color: Colors.pink,
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
                      
                    },
                    icon: const Icon(Icons.search),
                    iconSize: 28,
                    color: const Color.fromRGBO(0, 0, 0, 1),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: (){
                    Get.toNamed('my-cart');
                  },
                  child: badges.Badge(
                    position: badges.BadgePosition.topEnd(top: -19, end: -12),
                    showBadge: true,
                    ignorePointer: false,
                    badgeStyle: const badges.BadgeStyle(
                      shape: badges.BadgeShape.circle,
                      badgeColor: Colors.white,
                      padding: EdgeInsets.all(5),
                      // borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                        color: Colors.white,
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
                const CircleAvatar(
                  radius: 16,
                  backgroundColor: Colors.black,
                  child: Text('J'),
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