class CartShopp {
  String img_card;
  int qty;
  String name_card;
  String id_card;
  double price;
  String arcthype;

  CartShopp(
      {this.id_card, this.qty, this.name_card, this.img_card, this.price, this.arcthype});
          Map<String, dynamic> toJson() => {
        "img_card": img_card,
        "qty": qty.toString(),
        "name_card": name_card,
        "id_card": id_card.toString(),
        "price": price.toString(),
        'arcthype':arcthype
    };
 factory CartShopp.fromJson(Map<String, dynamic> json) {
    return CartShopp(
      id_card: json['id_card'] as String,
      qty: int.parse(json['qty']),
      name_card: json['name_card'] as String,
      price: double.parse(json['price']),
      arcthype: json['arcthype'] as String,
      img_card: json['img_url'] as String,

    );
  }
      
}

