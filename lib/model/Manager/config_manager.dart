import 'package:flutter/material.dart';

class ThemeAppConfig extends ChangeNotifier {
  var _theme = false;
  Locale _locale = const Locale('pt', 'BR');
  bool get getTheme => _theme;
  Locale get getLocale => _locale;

  set setThemeAppConfig(bool user) {
    _theme = user;
    notifyListeners();
  }

  set setLocaleConfig(Locale locale) {
      _locale = locale;
    notifyListeners();
  }

  notifyListeners();
}
