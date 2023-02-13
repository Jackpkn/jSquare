import 'package:flutter/material.dart';

class Themes {
  static final light = ThemeData.light().copyWith(
    appBarTheme: const AppBarTheme(
        color: Colors.white,
        centerTitle: true,
        actionsIconTheme: IconThemeData(color: Colors.green)),
    //  primarySwatch: Colors.grey,
    primaryColor: Colors.white,
    brightness: Brightness.light,
    dividerColor: Colors.white54,
    buttonTheme: const ButtonThemeData(
      buttonColor: Colors.cyan,
      textTheme: ButtonTextTheme.primary,
    ),
    iconTheme: const IconThemeData(color: Colors.black),
    // textTheme: const TextTheme(displayLarge: TextStyle(color: Colors.orange)),
    bottomAppBarTheme: const BottomAppBarTheme(color: Colors.cyan),
    //  colorScheme: ColorScheme(background: Colors.white),
    colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.black),
  );
  static final dark = ThemeData.dark().copyWith(
    // primarySwatch: Colors.grey,
    primaryColor: Colors.black,
    brightness: Brightness.dark,
    dividerColor: Colors.black12,
    // backgroundColor: Colors.black,
    buttonTheme: const ButtonThemeData(
      buttonColor: Colors.deepPurple,
      textTheme: ButtonTextTheme.primary,
    ),
    iconTheme: const IconThemeData(color: Colors.black),
    //  textTheme: const TextTheme(),
    bottomAppBarTheme: const BottomAppBarTheme(color: Colors.deepPurple),
    //  colorScheme: ColorScheme(background: const Color(0xFF212121)),
    colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.white),
  );
}
