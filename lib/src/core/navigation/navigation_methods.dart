import 'package:flutter/material.dart';
import 'package:st/src/ui/pages/cart/cart_page.dart';
import 'package:st/src/ui/pages/error_page/error_page.dart';
import 'package:st/src/ui/pages/home/home_page.dart';
import 'package:st/src/ui/pages/profile/profile_page.dart';

class RouteMethods{
  static Route<dynamic> generateRoutes(RouteSettings settings){
    // ignore: unused_local_variable
    final args = settings.arguments;
    switch (settings.name){
      case Home.route : return _materialPageRoute(const Home(title: 'home'));
      case Profile.route : return _materialPageRoute(const Profile());
      case Cart.route : return _materialPageRoute(const Profile());
      default : return _materialPageRoute(const ErrorPage());
    }
  }

  static MaterialPageRoute _materialPageRoute (Widget page)=> MaterialPageRoute(builder: (context) => page);
  static Future<Object?> navigateTo({required BuildContext context, required String routeName})=> Navigator.of(context).pushNamed(routeName);
}