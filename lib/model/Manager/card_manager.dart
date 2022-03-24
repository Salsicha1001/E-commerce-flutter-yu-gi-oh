import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/model/card/cards_list.dart';

class CardManager extends ChangeNotifier {
  List<CardList> _list = [];

  List<CardList> get getListCards => _list;

  notifyListeners();

  void addList(List<CardList> card) {
    _list.addAll(card);
    notifyListeners();
  }

  void clearList() {

    notifyListeners();
  }
}
