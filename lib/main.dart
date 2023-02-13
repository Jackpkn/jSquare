import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:jsquare/src/screens/pages_screen/home_page.dart';

import 'src/themes/colors_theme.dart';
import 'src/themes/theme_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'jSquare',
      theme: Themes.light,
      // initialRoute: '/splash_screen',
      // themeMode: ThemeMode.system,
      themeMode: ThemeService().theme,
      darkTheme: Themes.dark,
      home: const HomePage(),
    );
  }
}
