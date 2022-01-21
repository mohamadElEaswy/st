import 'package:flutter/material.dart';
import 'package:st/src/ui/colors/static_colors.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    primarySwatch: GlobalStaticColors.primaryColor,
    appBarTheme: const AppBarTheme(
      color: GlobalStaticColors.appBarColor,
      // color: Colors.indigo,
      elevation: 0.0,
      // actionsIconTheme: IconThemeData(
      //   color: Colors.black,
      // ),
      iconTheme: IconThemeData(
        color: Colors.black,
        // color: GlobalStaticColors.logoColor,
      ),
    ),
    scaffoldBackgroundColor: Colors.grey[50],
  );

  static ThemeData darkTheme = ThemeData(
    primarySwatch: Colors.blue,
  );

  static const TextStyle headerTextStyle = TextStyle(
    fontSize: 32.0,
    fontWeight: FontWeight.w300,
  );
}
