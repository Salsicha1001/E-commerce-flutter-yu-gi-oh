import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

class DolarToReal {
  static Future getReal() async {
    final response = await http.get(Uri.parse(
        'http://economia.awesomeapi.com.br/json/last/USD-BRL,EUR-BRL'));
    if (response.statusCode == 200) {
      Map json = jsonDecode(response.body);
      double result =
          double.parse(double.parse(json['USDBRL']['high']).toStringAsFixed(2));
      double resultEuro =
          double.parse(double.parse(json['EURBRL']['high']).toStringAsFixed(2));
      return new DolarEuro(dolar: result, euro: resultEuro);
    } else {
      return double.parse('1');
    }
  }
}

class DolarEuro {
  double dolar;
  double euro;
  DolarEuro({this.dolar, this.euro});
}
