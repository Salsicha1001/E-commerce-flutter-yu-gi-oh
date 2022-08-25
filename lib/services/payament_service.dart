import 'dart:convert';
import 'package:flutter_ecommerce/helpers/cripto.dart';
import 'package:flutter_ecommerce/helpers/url.config.dart';
import 'package:flutter_ecommerce/model/order_request.dart';
import 'package:flutter_ecommerce/model/order_response.dart';
import 'package:flutter_ecommerce/model/payament/cred-card.model.dart';
import 'package:flutter_ecommerce/model/user_model.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class OrderPayament {
  var url = UrlConfig().urlLocal;
  AddCartCred(CredCart card, context) async {
    Map data = {
      'cvv': Encrypt(card.cvv,
          Provider.of<UserManager>(context, listen: false).user.email),
      'expired': Encrypt(card.expired,
          Provider.of<UserManager>(context, listen: false).user.email),
      'name_card': Encrypt(card.name_card,
          Provider.of<UserManager>(context, listen: false).user.email),
      'number_card': Encrypt(card.number_card,
          Provider.of<UserManager>(context, listen: false).user.email),
      'id_user': Provider.of<UserManager>(context, listen: false).user.id_user
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

  getCredCards(context) async {
    final response = await http.get(
        Uri.parse(url +
            '/cred-card/?id=${Provider.of<UserManager>(context, listen: false).user.id_user}'),
        headers: <String, String>{
          "Content-Type": "application/json;charset=UTF-8"
        });
    if (response.statusCode == 200) {
      var msg = json.decode(utf8.decode(response.bodyBytes));
      if (msg['obj'] != null) {
        var listMap = (msg['obj'] as List);
        List<CredCart> listCard = listMap
            .map<CredCart>((json) => CredCart.fromJson(json,
                Provider.of<UserManager>(context, listen: false).user.email))
            .toList();
        return listCard;
      } else {
        return [];
      }
    }
  }

  removeCredCard(context, id) async {
    final response = await http.delete(Uri.parse(url + '/cred-card/?id=${id}'),
        headers: <String, String>{
          "Content-Type": "application/json;charset=UTF-8"
        });

    return;
  }

  saveOrder(context, OrderRequest request) async {
    Map data = {
      'listOrders': request.listOrders.map((e) => e.toJson()).toList(),
      'id_credCard': request.id_credCard,
      'id_user': Provider.of<UserManager>(context, listen: false).user.id_user
    };
    final response = await http.post(Uri.parse(url + '/orders'),
        headers: <String, String>{
          "Content-Type": "application/json;charset=UTF-8"
        },
        encoding: Encoding.getByName("utf-8"),
        body: (json.encode(data)));
    if (response.statusCode == 200) {
      return;
    }
  }

  getOrderByUser(context) async {
    final response = await http.get(
      Uri.parse(url +
          '/orders/?id=${Provider.of<UserManager>(context, listen: false).user.id_user}'),
      headers: <String, String>{
        "Content-Type": "application/json;charset=UTF-8"
      },
    );
    if (response.statusCode == 200) {
      var msg = json.decode(utf8.decode(response.bodyBytes));
      if (msg['obj'] != null) {
        var listMap = (msg['obj'] as List);
        List<OrderResponse> listCard = listMap
            .map<OrderResponse>((json) => OrderResponse.fromJson(json,
                Provider.of<UserManager>(context, listen: false).user.email))
            .toList();

        return listCard;
      }
    }
  }

  getOrders(context) async {
    final response = await http.get(
      Uri.parse(url + '/orders/admin'),
      headers: <String, String>{
        "Content-Type": "application/json;charset=UTF-8"
      },
    );
    if (response.statusCode == 200) {
      var msg = json.decode(utf8.decode(response.bodyBytes));
      if (msg['obj'] != null) {
        List listMap = (msg['obj'] as List);
        List<OrderResponse> listCard = listMap
            .map<OrderResponse>((json) => OrderResponse.fromJson(json,
                Provider.of<UserManager>(context, listen: false).user.email))
            .toList();

        return listCard;
      }
    }
  }
}
