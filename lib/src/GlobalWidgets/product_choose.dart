import 'package:flutter/material.dart';

class Product extends StatelessWidget {
  final String name;
  final bool isSelected;
  final VoidCallback onTap;
  double? width;
  Color? color;
  Color? textColor;
  Product(
      {super.key,
      required this.name,
      required this.isSelected,
      required this.onTap,
      required this.width,
      this.color, this.textColor});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 28,

        // width: 170,

        width: width,
        
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black, width: 1.3),
          borderRadius: BorderRadius.circular(10),
          color: color,
        ),
        child: Align(
          alignment: Alignment.center,
          child: Text(
            name,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: textColor,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
