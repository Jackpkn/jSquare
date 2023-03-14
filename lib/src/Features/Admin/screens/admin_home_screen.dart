import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jsquare/src/Features/Admin/screens/order_screen.dart';
import 'package:jsquare/src/controller/icon_visible_controller.dart';

import 'add_admin_product_screen.dart';
import 'post_screen.dart';

class AdminScreen extends StatefulWidget {
  const AdminScreen({super.key});

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  IconController controller = Get.put(IconController());

  double bottomBarWidth = 42;

  double bottomBarBorderWidth = 5;

 
  @override
  Widget build(BuildContext context) {
    Get.putAsync(() async => IconController());
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
         
          body: Obx(
            () => IndexedStack(
              index: controller.tabIndex.value,
              children: const [
                PostScreen(),
                AdminAddProduct(),
                OrderScreen(),
              ],
            ),
          ),
          bottomNavigationBar: Obx(
            () => BottomNavigationBar(
              currentIndex: controller.tabIndex.value,
              selectedItemColor: Colors.pink,
              enableFeedback: false,
              unselectedItemColor: const Color.fromARGB(255, 150, 142, 0),
              backgroundColor: Colors.black,
              iconSize: 28,
              onTap: controller.changeTabIndex,
              items: [
                BottomNavigationBarItem(
                  icon: Container(
                    width: bottomBarWidth,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                          controller.tabIndex.value == 0 ? 10 : 8),
                      border: Border.all(
                        color: controller.tabIndex.value == 0
                            ? Colors.pink
                            : Colors.orangeAccent,
                      ),
                      // border: Border(
                      //   top: BorderSide(
                      //     color: _page == 0 ? Colors.orange : Colors.green,
                      //     width: bottomBarBorderWidth,
                      //   ),
                      // ),
                    ),
                    child: const Icon(
                      Icons.home_outlined,
                    ),
                  ),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Container(
                    width: bottomBarWidth,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                          controller.tabIndex.value == 0 ? 10 : 8),
                      border: Border.all(
                          color: controller.tabIndex.value == 1
                              ? Colors.pink
                              : Colors.orangeAccent),
                    ),
                    child: const Icon(
                      Icons.analytics_outlined,
                    ),
                  ),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Container(
                    width: bottomBarWidth,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                          controller.tabIndex.value == 0 ? 10 : 8),
                      border: Border.all(
                          color: controller.tabIndex.value == 2
                              ? Colors.pink
                              : Colors.orangeAccent),
                    ),
                    child: const Icon(
                      Icons.all_inbox_outlined,
                    ),
                  ),
                  label: '',
                ),
              ],
            ),
          )),
    );
  }
}
