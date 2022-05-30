import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/Components/dialog_custom.dart';
import 'package:flutter_ecommerce/Components/load_custom.dart';
import 'package:flutter_ecommerce/model/Config/config.model.dart';
import 'package:flutter_ecommerce/model/Manager/config_manager.dart';
import 'package:flutter_ecommerce/model/register_user.dart';
import 'package:flutter_ecommerce/model/user_login.dart';
import 'package:flutter_ecommerce/model/user_model.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class UserService {
  var url = ("https://marcelogonzaga.dev.br");
  final box = GetStorage();
  loginUser(UserLogin userLogin, context) async {
    Map data = {
      'email': userLogin.email,
      'password': userLogin.password,
    };
    final response = await http.post(Uri.parse(url + '/auth/login'),
        headers: <String, String>{
          "Content-Type": "application/json;charset=UTF-8"
        },
        body: (json.encode(data)));
    if (response.statusCode == 200) {
      var msg = json.decode(utf8.decode(response.bodyBytes));
      Map user = {
        'id_user': msg['obj']['id'],
        'name': msg['obj']['username'],
        'email': msg['obj']['email'],
        'token': '${msg['obj']['type']} ${msg['obj']['token']}',
        'typeUser': msg['obj']['typeUser'],
      };
      Map preferences = {
        'theme': msg['obj']['roles']['theme'],
        'language': msg['obj']['roles']['language'],
      };
      User u = User.fromMap(user);
      Provider.of<UserManager>(context, listen: false).user = u;
      Config c = Config.fromMap(preferences);
      Provider.of<ThemeAppConfig>(context, listen: false).setLocaleConfig =
          c.language == ''
              ? const Locale('en', 'US')
              : const Locale('pt', 'BR');
      Provider.of<ThemeAppConfig>(context, listen: false).setThemeAppConfig =
          c.theme;
      box.write('jwt', u.token);
      box.write('id', u.id_user);
      box.write('name', u.name);
      box.write('email', u.email);
      box.write('theme', c.theme);
      box.write('language', c.language);
      if (u.typeUser == 'ADMIN') {
        box.write('ADMIN', true);
      } else {
        box.write('ADMIN', false);
      }

      LoadCustom().closeLoad();
      DialogsCustom().showAlertSucessRedirectMenu(context, ' ${msg['msg']}');
    } else {
      var msg = json.decode(utf8.decode(response.bodyBytes));
      LoadCustom().closeLoad();
      DialogsCustom().showDialogError(
          context, 'Erro  ${response.statusCode}', ' ${msg['msg']}');
      return msg['msg'];
    }
  }

  registerUserAdd(UserRegister userRegister, context) async {
    Map data = {
      'name': userRegister.name,
      'email': userRegister.email,
      'phone': userRegister.phone,
      'password': userRegister.password,
      'typeUser': 1,
      'cpf': userRegister.cpf,
      'address_user': userRegister.address_user?.map((e) => e.toJson()).toList()
    };
    final response = await http.post(Uri.parse(url + '/auth/add'),
        headers: <String, String>{
          "Content-Type": "application/json;charset=UTF-8"
        },
        encoding: Encoding.getByName("utf-8"),
        body: (json.encode(data)));
    if (response.statusCode == 201) {
      var msg = json.decode(utf8.decode(response.bodyBytes));
      return msg['msg'];
    } else {
      var msg = json.decode(utf8.decode(response.bodyBytes));

      DialogsCustom().showDialogAlert(
          context, 'Erro  ${response.statusCode}', ' ${msg['msg']}');
      return msg['msg'];
    }
  }

  getUserLoged(context) async {
    if (box.read('jwt') != null) {
      Provider.of<UserManager>(context, listen: false).user = User(
          id_user: box.read('id'),
          email: box.read('email'),
          name: box.read('name'),
          token: box.read('jwt'));
      await getThemeConfigUser(context);
    }
  }

  setThemeConfigUser(context) async {
    Map data = {
      'language':
          Provider.of<ThemeAppConfig>(context, listen: false).getLocale ==
                  const Locale('en', 'US')
              ? ''
              : 'pt',
      'theme': Provider.of<ThemeAppConfig>(context, listen: false).getTheme
    };
    final response = await http.post(
        Uri.parse(url +
            '/preferences/register/${Provider.of<UserManager>(context, listen: false).user.id_user}'),
        headers: <String, String>{
          "Content-Type": "application/json;charset=UTF-8"
        },
        encoding: Encoding.getByName("utf-8"),
        body: (json.encode(data)));
    if (response.statusCode == 200) {
      var msg = json.decode(utf8.decode(response.bodyBytes));
      return msg['msg'];
    }
  }

  getThemeConfigUser(context) async {
    final response = await http.get(
        Uri.parse(url +
            '/preferences/register/${Provider.of<UserManager>(context, listen: false).user.id_user}'),
        headers: <String, String>{
          "Content-Type": "application/json;charset=UTF-8"
        });
    if (response.statusCode == 200) {
      var msg = json.decode(utf8.decode(response.bodyBytes));
      box.write('theme', msg['obj']['theme']);
      box.write('language', msg['obj']['language']);
      Provider.of<ThemeAppConfig>(context, listen: false).setLocaleConfig =
          box.read('language') == ''
              ? const Locale('en', 'US')
              : const Locale('pt', 'BR');
      Provider.of<ThemeAppConfig>(context, listen: false).setThemeAppConfig =
          box.read('theme');
    }
  }
}
