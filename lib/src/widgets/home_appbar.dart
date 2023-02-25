import 'package:flutter/material.dart';

import '../themes/theme_storage.dart';

PreferredSizeWidget appbar() {
  return AppBar(
    // surfaceTintColor: Colors.orange,
    elevation: 0.3,
   
    title: const Text(
      'ABCDEFGH',
    ),

    leading: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 9),
        child: IconButton(
          onPressed: () => ThemeService().switchTheme(),
          icon: Icon(
            ThemeService().isDarkMode() ? Icons.dark_mode : Icons.light_mode,
            // Icons.light_mode,
            // color: Colors.lightGreen,
          ),
        )
        // DayNightSwitcherIcon(
        //     isDarkModeEnabled: ThemeService.isDarkMode,
        //     onStateChanged: (jack) {
        //       ThemeService().switchTheme();
        //     }),
        ),
    actions: [
      IconButton(
        onPressed: () {},
        icon: const Icon(
          Icons.search,
        ),
      ),
      IconButton(
        onPressed: () {},
        icon: const Icon(
          Icons.more_vert,
        ),
      ),
    ],
  );
}
