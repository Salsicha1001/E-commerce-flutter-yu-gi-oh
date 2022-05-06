class CredCart {
  int id_card ;
  CredCart({
    this.number_card,
    this.expired,
    this.cvv,
    this.name_card,
    this.id_card,
    
  });
  String number_card;
  String expired;
  String cvv;
  String name_card;

  factory CredCart.fromJson(Map<String, dynamic> json) {
    return CredCart(
      number_card: json['number_card'] as String,
      expired: json['expired'] as String,
      cvv: json['cvv'] as String,
      name_card: json['name_card'] as String,
      id_card: json['id_card'] ,

    );
  }

  Map<String, dynamic> toJson() => {
        "number_card": number_card,
        "expired": expired,
        "cvv": cvv,
        "name_card": name_card,
      };
}
