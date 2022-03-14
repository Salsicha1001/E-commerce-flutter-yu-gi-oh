// ignore_for_file: empty_constructor_bodies

import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';

class User {
  User({
    this.id_user,
    this.name,
    this.email,
    this.token,
  }) : super();
  int? id_user;
  String? name;
  String? email;
  String? token;

  Map toJson() => {
        'id_user': id_user,
        'name': name,
        'email': email,
        'token': token,
      };
  factory User.fromMap(Map<dynamic, dynamic> map) {
    return User(
      id_user: map['id_user'],
      name: map['name'],
      email: map['email'],
      token: map['token'],
    );
  }
  factory User.fromJson(String source) => User.fromMap(json.decode(source));
}

class UserManager extends ChangeNotifier {
  var _user = User();
  User get user => _user;

  bool get isLoggedIn => user.id_user != null;
  set user(User user) {
    _user = user;
    notifyListeners();
  }

  logout() {
    _user = new User();
    notifyListeners();
  }

  notifyListeners();
}
