import 'dart:convert';

class Address {
  Address({
    this.id_ed,
    required this.street,
    required this.district,
    required this.city,
    required this.state,
    required this.number_address,
     this.complement,
    required this.cep,
  });
  int? id_ed;
  String? street;
  String? district;
  String? city;
  String? state;
  String? number_address;
  String? complement;
  String? cep;

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      id_ed:0,
      street: json['logradouro'] as String,
      district: json['bairro'] as String,
      city: json['localidade'] as String,
      state: json['uf'] as String,
      number_address: '',
      cep: json['cep'] as String,
    );
  }

    Map<String, dynamic> toJson() => {
        "cep": cep,
        "street": street,
        "district": district,
        "city": city,
        "state": state,
        'number_address':number_address
    };



  @override
  String toString() {
    // TODO: implement toString
    return   "Address{" +
                " street='" + street! + '\'' +
                ", district='" + district! + '\'' +
                ", city='" + city! + '\'' +
                ", state='" + state! + '\'' +
                ", number_address='" + number_address!+ '\'' +
                ", cep='" + cep! + '\'' +
                '}';
  }
}
