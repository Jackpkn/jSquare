import 'package:flutter/material.dart';

PreferredSizeWidget appbar() {
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
                    onPressed: () {},
                    icon: const Icon(Icons.search),
                    iconSize: 28,
                    color: const Color.fromRGBO(0, 0, 0, 1),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                IconButton(
                  onPressed: () {},
                  iconSize: 28,
                  icon: const Icon(
                    Icons.shopping_cart,
                    color: Color.fromRGBO(0, 0, 0, 1),
                  ),
                ),
                const CircleAvatar(
                  radius: 18,
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
