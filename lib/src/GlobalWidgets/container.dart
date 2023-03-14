import 'package:flutter/material.dart';

class GlobalContainer extends StatelessWidget {
  final double height;
  final double width;
  final double borderWidth;
  final double? radius;
  final Color? color;
  final Widget? child;
  const GlobalContainer({
    super.key,
    required this.height,
    required this.width,
    required this.borderWidth,
    this.radius,
    this.color,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: color,
        border: Border.all(
          width: borderWidth,
        ),
        borderRadius: BorderRadius.circular(
          radius!,
        ),
      ),
      child: child!,
    );
  }
}


// flutter dsa 