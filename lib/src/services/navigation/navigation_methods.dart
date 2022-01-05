import 'package:flutter/material.dart';

class RouteMethods{
  static Future<Object?> navigator({required String navTo, required BuildContext context}) => Navigator.pushNamed(context, navTo);
}