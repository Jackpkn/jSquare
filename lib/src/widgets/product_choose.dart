import 'package:flutter/material.dart';

class Product extends StatelessWidget {
  final String name;
  final bool isSelected;
  final VoidCallback onTap;
  double? width;
  Product(
      {super.key,
      required this.name,
      required this.isSelected,
      required this.onTap,
      required this.width});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 28,

        // width: 170,

        width: width,
        // margin: const EdgeInsets.only(left: 6, right: 8, top: 6),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black, width: 1.3),
          borderRadius: BorderRadius.circular(20),
          color: isSelected ? Colors.black : Colors.white,
        ),
        child: Align(
          alignment: Alignment.center,
          child: Text(
            name,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.black,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
