import 'dart:convert';
import 'dart:developer';
import 'package:flutter_ecommerce/Components/dialog_custom.dart';
import 'package:flutter_ecommerce/model/address.dart';
import 'package:flutter_ecommerce/model/register_user.dart';
import 'package:flutter_ecommerce/model/user_login.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UserService {
  var url = ("http://192.168.100.15:8080/auth");
  void loginUser(UserLogin userLogin) async {
    Map data = {
      'email': userLogin.email,
      'password': userLogin.password,
    };

    final response = await http.post(Uri.parse(url + '/login'),
        headers: <String, String>{
          "Content-Type": "application/json;charset=UTF-8"
        },
        body: (json.encode(data)));
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
