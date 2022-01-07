import 'package:flutter/material.dart';
import 'package:st/src/core/navigation/navigation_methods.dart';
import 'package:st/src/ui/pages/home/home_page.dart';
import 'package:st/src/ui/theme/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  static const String title = 'Stabraq';
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      theme: AppTheme.lightTheme,
      home: const Home(title: title),
      onGenerateRoute: RouteMethods.generateRoutes,
      initialRoute: Home.route,
    );
  }
}

