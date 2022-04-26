import 'dart:convert';
import 'package:flutter_ecommerce/model/payament/cred-card.model.dart';
import 'package:flutter_ecommerce/model/user_model.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class OrderPayament{
  var url = ("http://192.168.100.15:8080");
  AddCartCred(CredCart card, context) async {
    Map data = {
      'cvv': card.cvv,
      'expired': card.expired,
      'name_card': card.name_card,
      'number_card': card.number_card,
      'id_user':Provider.of<UserManager>(context).user.id_user
    };
    final response = await http.post(Uri.parse(url + '/cred-card/save'),
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
      return msg['msg'];
    }
  }
}