import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jsquare/src/Features/Home/controllers/home_controller.dart';

class HeadTabs extends StatelessWidget {
  const HeadTabs({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    return Obx(
      () => Container(
        width: 320,
        height: 48,
        margin: const EdgeInsets.only(bottom: 0),
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.5),
          borderRadius: const BorderRadius.all(Radius.circular(5)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
                child: Container(
                  width: 150,
                  height: 40,
                  margin: const EdgeInsets.only(bottom: 0),
                  padding: const EdgeInsets.all(0),
                  decoration: controller.tabStatus.value
                      ? BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(5)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.1),
                              spreadRadius: 2,
                              blurRadius: 3,
                              offset: const Offset(
                                  0, 2), // changes position of shadow
                            ),
                          ],
                        )
                      : const BoxDecoration(),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        child: const Text(
                          "Furniture",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.normal,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                onTap: () {
                  controller.toggleTabs();
                }),
            GestureDetector(
              child: Container(
                width: 150,
                height: 40,
                margin: const EdgeInsets.only(bottom: 0),
                padding: const EdgeInsets.all(0),
                decoration: controller.tabStatus.value
                    ? const BoxDecoration()
                    : BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(5)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.1),
                            spreadRadius: 2,
                            blurRadius: 3,
                            offset: const Offset(
                                0, 2), // changes position of shadow
                          ),
                        ],
                      ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      child: const Text(
                        "Appliances",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.normal,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              onTap: () {
                controller.toggleTabs();
              },
            ),
          ],
        ),
      ),
    );
  }
}
