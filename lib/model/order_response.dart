import 'package:flutter_ecommerce/model/cart_shopp.dart';
import 'package:flutter_ecommerce/model/payament/cred-card.model.dart';

class OrderResponse {
  List<CartShopp> cardOrders;
  int id;
  String codOrders;
  String totalValue;
  String dateShopp;
  String hourShopp;
  String name;
  CredCart credCard;

  OrderResponse({
    this.id,
    this.codOrders,
    this.totalValue,
    this.dateShopp,
    this.hourShopp,
    this.credCard,
    this.cardOrders,
    this.name
  });

  Map toJson() => {
        'id': id,
        'codOrders': codOrders,
        'totalValue': totalValue,
        'dateShopp': dateShopp,
        'hourShopp': hourShopp,
        'credCard': credCard.toJson(),
        'cardOrders': cardOrders?.map((e) => e.toJson()).toList(),
        'name':name
      };
  factory OrderResponse.fromJson(Map<String, dynamic> map) {
    return OrderResponse(
      id: map['id'] as int,
      codOrders: map['codOrders'] as String,
      totalValue: map['totalValue'] as String,
      dateShopp: map['dateShopp'] as String,
      hourShopp: map['hourShopp'] as String,
      name: map['userId']['name'],
      credCard:
          map['credCard'] != null ? CredCart.fromJson(map['credCard']) : null,
      cardOrders: List<CartShopp>.from(
          map['cardOrders'].map((x) => CartShopp.fromJson(x))),
    );
  }
}
