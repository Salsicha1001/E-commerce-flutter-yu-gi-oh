import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/model/cart_shopp.dart';

class CartShoppManager extends ChangeNotifier {
  List<CartShopp> list = [];
  num productsPrice = 0.0;
  String deliveryPrice = 'Gratis';

  num get totalPrice => productsPrice;

  List<CartShopp> get getCarsShopps => list;

  notifyListeners();

  addItemCart(CartShopp card) {
    int i = list.indexWhere((element) => element.id_card == card.id_card);
    if (i >= 0 && card.img_card == list[i].img_card) {
      if (card.qty == 1) {
        card.qty++;
      }
      list[i] = card;
    } else {
      list.add(card);
    }
    resultTotalCart();
    notifyListeners();
  }

  resultTotalCart() {
    num value = 0.0;
    list.forEach((element) {
      value += element.price * element.qty;
    });
    productsPrice = value;
  }

  removeItemCart(CartShopp card) {
    int i = list.indexWhere((element) => element.id_card == card.id_card);
    if (i >= 0 && card.qty >= 1) {
      list[i] = card;
    } else {
      list.removeAt(i);
    }
    resultTotalCart();
    notifyListeners();
  }

  clearCard() {
    productsPrice = 0.0;
    list.clear();
    notifyListeners();
  }
}
