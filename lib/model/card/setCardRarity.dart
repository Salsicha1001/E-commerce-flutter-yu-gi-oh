class CardsSet {
  String set_name;
  String set_code;
  String set_rarity;
  String set_rarity_code;
  String set_price;

  CardsSet(
      {this.set_name,
      this.set_code,
      this.set_rarity,
      this.set_rarity_code,
      this.set_price});

  factory CardsSet.fromJson(Map<String, dynamic> json) {
    return CardsSet(
      set_name: json['set_name'] as String,
      set_code: json['set_code'] as String,
      set_rarity: json['set_rarity'] as String,
      set_rarity_code: json['set_rarity_code'] as String,
      set_price: json['set_price'] as String,
    );
  }

  Map<String, dynamic> toJson() => {
        "set_name": set_name,
        "set_code": set_code,
        "set_rarity": set_rarity,
        "set_rarity_code": set_rarity_code,
        "set_price": set_price,
      };
}
