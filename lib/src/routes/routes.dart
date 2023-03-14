import 'package:flutter/material.dart';

import 'package:jsquare/src/Features/Home/screens/home_page.dart';
import 'package:jsquare/src/Features/User/screens/profile_page.dart';
import 'package:jsquare/src/Features/User/screens/myfavourites.dart';
import 'package:jsquare/src/Features/User/screens/ratingandreviews.dart';
import 'package:jsquare/src/Features/User/screens/recommended_page.dart';
import 'package:jsquare/src/Features/User/screens/your_orders.dart';
import 'package:jsquare/src/Features/auth/screens/forgot_screen.dart';
import 'package:jsquare/src/Features/auth/screens/login_screen.dart';
import 'package:jsquare/src/Features/auth/screens/opt_screen.dart';
import 'package:jsquare/src/Features/auth/screens/signup_screen.dart';
import 'package:jsquare/src/Features/category/screens/category_product.dart';

Route<dynamic> generateRoutes(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case IntroPage.routeName:
      return MaterialPageRoute(
        builder: (_) => const IntroPage(),
      );
    case LoginScreen.routeName:
      return MaterialPageRoute(
        builder: (_) => LoginScreen(),
      );
    case SignUpScreen.routeName:
      return MaterialPageRoute(
        builder: (_) => SignUpScreen(),
      );
    case ForgotScreen.routeName:
      return MaterialPageRoute(
        builder: (_) => ForgotScreen(),
      );
    case OtpScreen.routeName:
      return MaterialPageRoute(
        builder: (_) => const OtpScreen(),
      );

    case ProfilePage.routeName:
      return MaterialPageRoute(
        builder: (_) => ProfilePage(),
      );
    case OrdersPage.routeName:
      return MaterialPageRoute(
        builder: (_) => const OrdersPage(),
      );
    case RecommendedPage.routeName:
      return MaterialPageRoute(
        builder: (_) => const RecommendedPage(),
      );
    case RatingAndReviews.routeName:
      return MaterialPageRoute(
        builder: (_) => const RatingAndReviews(),
      );
    case FavouritesPage.routeName:
      return MaterialPageRoute(
        builder: (_) => const FavouritesPage(),
      );
    case CategoryProduct.routeName:
      final category = routeSettings.arguments as String;
      return MaterialPageRoute(
        builder: (_) => CategoryProduct(
          category: category,
        ),
      );
    default:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const Scaffold(
          body: Center(
            child: Text('Screen does not exist!'),
          ),
        ),
      );
  }
}
