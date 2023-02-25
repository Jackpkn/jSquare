import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'src/screens/pages_screen/my_cart_page.dart';
import 'src/themes/colors_theme.dart';
import 'src/themes/theme_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // for showing full screen
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

  //for setting orientation to portrait only
  SystemChrome.setPreferredOrientations(
          [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown])
      .then((value) async {
    await GetStorage.init();
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'jSquare',
      theme: Themes.light,
      debugShowCheckedModeBanner: false,
      themeMode: ThemeService().theme,
      darkTheme: Themes.dark,
      // routes: appRoutes(),
      home: const MyCart(),
    );
  }
}
