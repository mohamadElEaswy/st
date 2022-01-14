import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:st/l10n/l10n.dart';

class LocaleProvider extends ChangeNotifier{

  LocaleProvider(Locale locale) : _locale = locale;

  Locale? _locale;

  Locale get locale =>_locale!;


    void setLocale(Locale locale){
      //if the language dos not exist
      if(!L10n.all.contains(locale)) return;
      _locale =locale;
      notifyListeners();
    }
    void clearLocale(){
      _locale = null;
      notifyListeners();
    }


}