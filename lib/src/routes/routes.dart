import 'package:get/get.dart';
import 'package:jsquare/src/screens/pages_screen/home_page.dart';

appRoutes() => [
      GetPage(
        name: 'home',
        page: () => HomePage(),
        transition: Transition.rightToLeft
      ),
    ];
