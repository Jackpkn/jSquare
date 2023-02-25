import 'package:flutter/material.dart';

PreferredSizeWidget filerAppbar() {
  return AppBar(
    backgroundColor: const Color.fromARGB(255, 229, 223, 223),
    flexibleSpace: Padding(
      padding: const EdgeInsets.only(
        right: 4,
        top: 3,
        left: 4,
      ),
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.apple),
                  iconSize: 35,
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.search),
                  iconSize: 35,
                ),
              ],
            ),
            Row(
              children: [
                IconButton(
                  onPressed: () {},
                  iconSize: 35,
                  icon: const Icon(Icons.apple),
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
