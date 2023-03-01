import 'package:get/get.dart';
import 'package:jsquare/src/models/tv_models.dart';
import 'package:jsquare/src/Features/Product_pages/tv_products/tv_products.dart';
import 'package:jsquare/src/Features/filter_page.dart';
import 'package:jsquare/src/Features/auth/screens/login_screen.dart';
import 'package:jsquare/src/Features/my_cart_page.dart';
import 'package:jsquare/src/Features/product_details_page.dart';

TvModel? data;
appRoutes() => [
      GetPage(
        name: 'login',
        page: () => LoginScreen(),
        transition: Transition.rightToLeft,
      ),
      GetPage(
        name: 'home',
        page: () => const TVsPage(),
        transition: Transition.rightToLeft,
      ),
      GetPage(
        name: 'home',
        page: () => const TVsPage(),
        transition: Transition.rightToLeft,
      ),
      GetPage(
        name: 'TvS',
        page: () => const TVsPage(),
        transition: Transition.rightToLeft,
      ),
      GetPage(
        name: 'ProductDetails',
        page: () => ProductDetails(
          data: data!,
        ),
        transition: Transition.rightToLeft,
      ),
      GetPage(
        name: 'MyCart',
        page: () => const MyCart(),
        transition: Transition.rightToLeft,
      ),
      GetPage(
        name: 'filterPage',
        page: () => const FilterPage(),
        transition: Transition.rightToLeft,
      ),
    ];
