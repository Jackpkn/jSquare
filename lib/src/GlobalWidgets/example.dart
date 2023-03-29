import 'package:flutter/material.dart';
import 'package:focused_menu_custom/focused_menu.dart';
import 'package:focused_menu_custom/modals.dart';

class Example extends StatelessWidget {
  const Example({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          FocusedMenuHolder(
            onPressed: () {},
            menuWidth: MediaQuery.of(context).size.width * 0.50,
            blurSize: 5.0,
            menuItemExtent: 45,
            menuBoxDecoration: const BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.all(Radius.circular(15.0))),
            duration: const Duration(milliseconds: 100),
            animateMenuItems: true,
            blurBackgroundColor: Colors.black54,
            openWithTap:
                true, // Open Focused-Menu on Tap rather than Long Press
            menuOffset:
                10.0, // Offset value to show menuItem from the selected item
            bottomOffsetHeight:
                80.0, // Offset height to consider, for showing the menu item ( for example bottom navigation bar), so that the popup menu will be shown on top of selected item.
            menuItems: <FocusedMenuItem>[
              // Add Each FocusedMenuItem  for Menu Options
              FocusedMenuItem(
                title: const Text("Open"),
                trailingIcon: const Icon(Icons.open_in_new),
                onPressed: () => FocusedMenuHolder(
                  onPressed: () {},
                  menuWidth: MediaQuery.of(context).size.width * 0.50,
                  blurSize: 5.0,
                  menuItemExtent: 45,
                  menuBoxDecoration: const BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.all(Radius.circular(15.0))),
                  duration: const Duration(milliseconds: 100),
                  animateMenuItems: true,
                  blurBackgroundColor: Colors.black54,
                  openWithTap:
                      true, // Open Focused-Menu on Tap rather than Long Press
                  menuOffset:
                      10.0, // Offset value to show menuItem from the selected item
                  bottomOffsetHeight:
                      80.0, // Offset height to consider, for showing the menu item ( for example bottom navigation bar), so that the popup menu will be shown on top of selected item.
                  menuItems: <FocusedMenuItem>[
                    // Add Each FocusedMenuItem  for Menu Options
                    FocusedMenuItem(
                        title: const Text("Open"),
                        trailingIcon: const Icon(Icons.open_in_new),
                        onPressed: () {}),
                    FocusedMenuItem(
                        title: const Text("Share"),
                        trailingIcon: const Icon(Icons.share),
                        onPressed: () {}),
                    FocusedMenuItem(
                        title: const Text("Favorite"),
                        trailingIcon: const Icon(Icons.favorite_border),
                        onPressed: () {}),
                    FocusedMenuItem(
                        title: const Text(
                          "Delete",
                          style: TextStyle(color: Colors.redAccent),
                        ),
                        trailingIcon: const Icon(
                          Icons.delete,
                          color: Colors.redAccent,
                        ),
                        onPressed: () {}),
                  ],
                  child: const Text("jack"),
                ),
              ),
              FocusedMenuItem(
                  title: const Text("Share"),
                  trailingIcon: const Icon(Icons.share),
                  onPressed: () {
                    FocusedMenuHolder(
                      onPressed: () {},
                      menuItems: [
                         FocusedMenuItem(
                title: const Text(
                  "Delete",
                  style: TextStyle(color: Colors.redAccent),
                ),
                trailingIcon: const Icon(
                  Icons.delete,
                  color: Colors.redAccent,
                ),
                onPressed: () {},
              ),
                      ],
                      child: const Text('jack'),
                    );
                  }),
              FocusedMenuItem(
                title: const Text("Favorite"),
                trailingIcon: const Icon(Icons.favorite_border),
                onPressed: () {},
              ),
              FocusedMenuItem(
                title: const Text(
                  "Delete",
                  style: TextStyle(color: Colors.redAccent),
                ),
                trailingIcon: const Icon(
                  Icons.delete,
                  color: Colors.redAccent,
                ),
                onPressed: () {},
              ),
            ],
            child: const Text("jack"),
          ),
        ],
      ),
    );
  }
}
