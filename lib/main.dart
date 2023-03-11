// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:jsquare/src/Features/Home/screens/home_page.dart';

import 'package:jsquare/src/Features/auth/services/auth_services.dart';
import 'package:jsquare/src/providers/user_provider.dart';
import 'package:jsquare/src/routes/routes.dart';

import 'src/themes/colors_theme.dart';
import 'src/themes/theme_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // for showing full screen
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  configLoading();
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
  final themeController = Get.put(ThemeController());
  @override
  void initState() {
    authServices.getUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      builder: EasyLoading.init(),
      title: 'jSquare',
      theme: Themes.light,
      debugShowCheckedModeBanner: false,
      darkTheme: Themes.light,
      themeMode: themeController.theme,
      onGenerateRoute: (settings) => generateRoutes(settings),
      // home: AdminScreen(),
      home: const IntroPage(),
      // home: userProvider.user.token.isNotEmpty
      //     ? userProvider.user.type == 'user'
      //         ? const IntroPage()
      //         : const AdminAddProduct()
      //     : LoginScreen(),
    );
  }
}

class ThemeChanger extends StatelessWidget {
  ThemeChanger({super.key});
  final themeController = Get.put(ThemeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () {
                if (Get.isDarkMode) {
                  themeController.changeTheme(Themes.light);
                  themeController.saveTheme(false);
                } else {
                  themeController.changeTheme(Themes.dark);
                  themeController.saveTheme(true);
                }
              },
              icon: Get.isDarkMode
                  ? const Icon(Icons.light_mode_outlined)
                  : const Icon(Icons.dark_mode_outlined),
            )
          ],
        ),
      ),
    );
  }
}

void configLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.fadingCircle
    ..loadingStyle = EasyLoadingStyle.dark
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..progressColor = Colors.white
    ..backgroundColor = Colors.green
    ..indicatorColor = Colors.white
    ..textColor = Colors.white
    ..userInteractions = false
    ..maskType = EasyLoadingMaskType.black
    ..dismissOnTap = true;
}

//
 