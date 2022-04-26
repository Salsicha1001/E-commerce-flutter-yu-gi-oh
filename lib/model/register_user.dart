import 'dart:convert';

import 'package:flutter_ecommerce/model/address.dart';

class UserRegister {
  String name;
  String email;
  String password;
  String phone;
  String cpf;
  int typeUser = 1;
  List<Address> address_user;

  UserRegister(
      {this.name,
      this.email,
      this.password,
      this.phone,
      this.typeUser,
      this.cpf,
      this.address_user});
  Map toJson() => {
        'name': name,
        'email': email,
        'password': password,
        'phone': phone,
        'cpf': cpf,
        'typeUser': typeUser,
        'address_user': address_user?.map((e) => e.toJson()).toList()
      };
  factory UserRegister.fromMap(Map<UserRegister, dynamic> map) {
    return UserRegister(
      name: map['name'],
      email: map['email'],
      password: map['password'],
      phone: map['phone'],
      typeUser: map['typeUser'],
      cpf: map['cpf'],
      address_user: List<Address>.from(map['address_user']),
    );
  }
  factory UserRegister.fromJson(String source) =>
      UserRegister.fromMap(json.decode(source));
}
