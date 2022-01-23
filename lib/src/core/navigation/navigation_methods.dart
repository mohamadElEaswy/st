import 'package:flutter/material.dart';
import 'package:st/src/ui/pages/cart/cart_page.dart';
import 'package:st/src/ui/pages/error_page/error_page.dart';
import 'package:st/src/ui/pages/home/home_page.dart';
import 'package:st/src/ui/pages/login/login_page.dart';
import 'package:st/src/ui/pages/profile/profile_page.dart';
import 'package:st/src/ui/pages/register/register.dart';
import 'package:st/src/ui/pages/single_product/single_product.dart';

class RouteMethods {
  static Route<dynamic> generateRoutes(RouteSettings settings) {
    // ignore: unused_local_variable
    final args = settings.arguments;
    switch (settings.name) {
      //home page & the initial route
      case Home.route:
        return _materialPageRoute(page: const Home(title: 'home'));
      //profile page
      case Profile.route:
        return _materialPageRoute(
            page: const Profile(), fullscreenDialog: true);
      //cart page
      case Cart.route:
        return _materialPageRoute(page: const Cart(), fullscreenDialog: true);
      //login page
      case LoginPage.route:
        return _materialPageRoute(page: const LoginPage());
      //single product page
      case SingleProductPage.route:
        return _materialPageRoute(
            page: SingleProductPage(productNumber: args), fullscreenDialog: true);
      //single registerPage page
      case RegisterPage.route:
        return _materialPageRoute(
          page: const RegisterPage(),
        );
      default:
        return _materialPageRoute(page: const ErrorPage());
    }
  }

  static _materialPageRoute(
          {required Widget page, bool fullscreenDialog = false}) =>
      MaterialPageRoute(
          builder: (context) => page, fullscreenDialog: fullscreenDialog);
  static Future<Object?> navigateTo(
      {required BuildContext context,
      required String routeName,
      dynamic args}) async {
    Navigator.of(context).pushNamed(routeName, arguments: args);
    return null;
  }
}
