import 'package:flutter/cupertino.dart';
import 'package:flutter_ecommerce/model/Manager/config_manager.dart';
import 'package:provider/provider.dart';

String getLanguge(context) {
  Locale lc = Provider.of<ThemeAppConfig>(context, listen: false).getLocale;
  if (lc == Locale('pt', 'BR')) {
    return "pt";
  }else{
  return "";
  }
}
