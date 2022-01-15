import 'dart:ui';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:flutter/material.dart';
import 'package:st/l10n/l10n.dart';

class LocaleProvider extends ChangeNotifier {

  Locale _locale = const Locale('en');

  Locale get locale => _locale;

//change language method
  void setLocale(Locale locale) {
    if (!L10n.all.contains(locale)) return;

    _locale = locale;
    notifyListeners();
  }

  void clearLocale() {
    _locale = const Locale('en');
    notifyListeners();
  }

  Future<Locale> getLocaleData() async {
    var prefs = await SharedPreferences.getInstance();
    String? languageCode = prefs.getString('language_code');
    if (languageCode  == null) {
      return window.locale;
    } else {
      return Locale(languageCode);
    }
  }
}
