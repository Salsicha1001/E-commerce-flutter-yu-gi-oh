import 'dart:convert';
import 'package:flutter_ecommerce/model/order_request.dart';
import 'package:flutter_ecommerce/model/order_response.dart';
import 'package:flutter_ecommerce/model/payament/cred-card.model.dart';
import 'package:flutter_ecommerce/model/user_model.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class OrderPayament {
  var url = ("https://marcelogonzaga.dev.br");
  AddCartCred(CredCart card, context) async {
    Map data = {
      'cvv': card.cvv,
      'expired': card.expired,
      'name_card': card.name_card,
      'number_card': card.number_card,
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
        List<CredCart> listCard =
            listMap.map<CredCart>((json) => CredCart.fromJson(json)).toList();
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
            .map<OrderResponse>((json) => OrderResponse.fromJson(json))
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
            .map<OrderResponse>((json) => OrderResponse.fromJson(json))
            .toList();

        return listCard;
      }
    }
  }
}
