import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter_ecommerce/Components/dialog_custom.dart';
import 'package:flutter_ecommerce/Components/load_custom.dart';
import 'package:flutter_ecommerce/model/register_user.dart';
import 'package:flutter_ecommerce/model/user_login.dart';
import 'package:flutter_ecommerce/model/user_model.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class UserService {
  var url = ("http://192.168.100.15:8080/auth");
  loginUser(UserLogin userLogin, context) async {
    Map data = {
      'email': userLogin.email,
      'password': userLogin.password,
    };
    final response = await http.post(Uri.parse(url + '/login'),
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
        'token': '${msg['obj']['tokenType']} ${msg['obj']['accessToken']}'
      };
      Provider.of<UserManager>(context, listen: false).user =
          User.fromMap(user);
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
    final response = await http.post(Uri.parse(url + '/add'),
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
}
