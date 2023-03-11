import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jsquare/src/Features/Admin/screens/order_screen.dart';
import 'package:jsquare/src/controller/icon_visible_controler.dart';

import 'add_admin_product_screen.dart';
import 'post_screen.dart';

class AdminScreen extends StatefulWidget {
  const AdminScreen({super.key});

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  late int _page = 0;
  IconController controller = Get.put(IconController());

  double bottomBarWidth = 42;

  double bottomBarBorderWidth = 5;

  List<Widget> pages = [
    const PostScreen(),
    const AdminAddProduct(),
    const OrderScreen(),
  ];
  void updatePage(int page) {
    setState(() {
      _page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    Get.putAsync(() async => IconController());
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              // Get.to(SignUpScreen());
            },
          ),
          title: const Text(
            'Main screen',
          ),
        ),
        body: pages[_page],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: controller.selectIndex,
          selectedItemColor: Colors.pink,
          unselectedItemColor: Colors.teal,
          backgroundColor: Colors.blue,
          iconSize: 28,
          onTap: updatePage,
          items: [
            BottomNavigationBarItem(
              icon: Container(
                width: bottomBarWidth,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(_page == 0 ? 10 : 8),
                  border: Border.all(
                    color: _page == 0 ? Colors.orange : Colors.pink,
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
                  border: Border(
                    top: BorderSide(
                      color: _page == 1 ? Colors.orange : Colors.green,
                      width: bottomBarBorderWidth,
                    ),
                  ),
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
                  border: Border(
                    top: BorderSide(
                      color: _page == 2 ? Colors.orange : Colors.green,
                      width: bottomBarBorderWidth,
                    ),
                  ),
                ),
                child: const Icon(
                  Icons.all_inbox_outlined,
                ),
              ),
              label: '',
            ),
          ],
        ),
      ),
    );
  }
}
