// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:jsquare/src/Features/auth/screens/login_screen.dart';
import 'package:jsquare/src/providers/product_provider.dart';
import 'package:provider/provider.dart';
import 'package:jsquare/src/Features/auth/services/auth_services.dart';
import 'package:jsquare/src/providers/user_provider.dart';
import 'package:jsquare/src/routes/routes.dart';
import 'src/Features/Home/screens/home_page.dart';
import 'src/controller/icon_visible_controller.dart';
import 'src/themes/colors_theme.dart';
import 'src/themes/theme_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // for showing full screen

  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  configLoading();
  //for setting orientation to portrait only
  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ],
  ).then(
    (value) async {
      await GetStorage.init();

      runApp(
        MultiProvider(
          providers: [
            ChangeNotifierProvider(
              create: (context) => UserProvider(),
            ),
            ChangeNotifierProvider(
              create: (context) => ProductProvider(),
            ),
            ChangeNotifierProvider(
              create: (context) => ImageController(),
            ),
            // ChangeNotifierProvider(
            //   create: (context) => ProductController(),
            // ),
          ],
          child: const MyApp(),
        ),
      );
    },
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final authServices = Get.put(AuthService());
  final themeController = Get.put(ThemeController());
  final userProvider = Get.put(UserProvider());

  @override
  void initState() {
    authServices.getUser(context: context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      builder: EasyLoading.init(),
      title: 'jSquare',
      // theme: Themes.dark,
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
      debugShowCheckedModeBanner: false,
      // darkTheme: Themes.dark,
      darkTheme: ThemeData(
        // focusColor: Colors.black,
        // textTheme: const TextTheme(),
        // textSelectionTheme:
        //     const TextSelectionThemeData(cursorColor: Colors.black),
      ),
      // themeMode: themeController.theme,
      themeMode: ThemeMode.dark,

      onGenerateRoute: (settings) => generateRoutes(settings),
      // home:   const AllReviews(),
      // home: const ProductAddScreen(),
      home: Provider.of<UserProvider>(context).user.token.isNotEmpty
          ? const IntroPage()
          : LoginScreen(),
      // home: const TableWidget(),
      // home: const IntroPage(),
      // home: userProvider.user.token.isNotEmpty
      //     ? userProvider.user.type == 'user'
      //         ? const IntroPage()
      // //         : const AdminAddProduct()
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

// java script node js flutter firebase dsa
List<double> fist = [1, 2, 3, 4, 5, 6];
List<double> second = [3, 2, 3, 5, 6, 7, 8, 9, 10];

List<double> output =
    fist.where((element) => !second.contains(element)).toList();


// flutter firebase node js mongoDB DSA =>  24 8 ->  16 -> 2=> 14 -> Mathematic 2=>12 AI ->3->DSA 9-4 APP 5 ->   