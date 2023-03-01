import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:jsquare/src/Features/Admin/screens/admin_product.dart';
import 'package:jsquare/src/Features/auth/services/auth_services.dart';
import 'package:jsquare/src/providers/user_provider.dart';

import 'src/Features/Home/screens/home_page.dart';
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

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final authServices = Get.put(AuthService());
  final userProvider = Get.put(UserProvider());
  @override
  void initState() {
    authServices.getUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'jSquare',
      theme: Themes.light,
      defaultTransition: Transition.leftToRight,
      debugShowCheckedModeBanner: false,
      themeMode: ThemeService().theme,
      darkTheme: Themes.dark,
      // routes: appRoutes(),
      home: IntroPage(),
    );
  }
}
