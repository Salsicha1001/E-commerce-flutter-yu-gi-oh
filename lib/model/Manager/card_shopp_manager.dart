import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/model/cart_shopp.dart';

class CartShoppManager extends ChangeNotifier {
  List<CartShopp> list = [];
  num productsPrice = 0.0;
  num deliveryPrice;

  num get totalPrice => productsPrice + (deliveryPrice ?? 0);

  List<CartShopp> get getCarsShopps => list;

  notifyListeners();

  addItemCart(CartShopp card) {
    int i = list.indexWhere((element) => element.id_card == card.id_card);
    if (i >= 0 && card.img_card == list[i].id_card) {
      if (card.qty==1) {
        card.qty++;
      }
      list[i] = card;
    } else {
      list.add(card);
    }
    productsPrice += card.price * card.qty;
    notifyListeners();
  }

  removeItemCart(CartShopp card) {
    int i = list.indexWhere((element) => element.id_card == card.id_card);
    if (i >= 0 && card.qty > 1) {
      list[i] = card;
    } else {
      list.removeAt(i);
    }
    productsPrice -= card.price * card.qty;
    notifyListeners();
  }
}
