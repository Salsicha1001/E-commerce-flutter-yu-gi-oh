
import 'package:flutter/cupertino.dart';

class ThemeApp extends ChangeNotifier {

 var _theme = false;
  bool get getTheme => _theme;

  set setThemeApp(bool user) {
    _theme = user;
    notifyListeners();
  }


  notifyListeners();
}