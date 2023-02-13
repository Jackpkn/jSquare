import 'package:flutter/material.dart';

Container container(Widget? child, double? height, double? width) {
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 5),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(4),
      boxShadow: const [
        BoxShadow(
          color: Colors.white,
          offset: Offset(3, 0),
          blurStyle: BlurStyle.solid,
        ),
      ],
    ),
    height: height,
    width: width,
    child: child,
  );
}
