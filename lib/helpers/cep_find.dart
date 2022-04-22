import 'dart:convert';
import 'package:flutter_ecommerce/model/address.dart';
import 'package:http/http.dart' as http;

class ViaCepService {
  static Future fetchCep({String cep}) async {
    final response =
        await http.get(Uri.parse('https://viacep.com.br/ws/$cep/json/'));
    if (response.statusCode == 200) {
      Map json = jsonDecode(response.body);
      if (json['erro'].toString() != 'true') {
        return Address.fromJson(jsonDecode(response.body));
      } else {
        return null;
      }
    } else {
      throw 'Error';
    }
  }

}
