class CardsPrices {
  String cardmarket_price;
  String tcgplayer_price;
  String ebay_price;
  String amazon_price;
  String coolstuffinc_price;

  CardsPrices(
      {this.cardmarket_price,
      this.tcgplayer_price,
      this.ebay_price,
      this.amazon_price,
      this.coolstuffinc_price});

  factory CardsPrices.fromJson(Map<String, dynamic> json) {
    return CardsPrices(
      cardmarket_price: json['cardmarket_price'] as String,
      tcgplayer_price: json['tcgplayer_price'] as String,
      ebay_price: json['ebay_price'] as String,
      amazon_price: json['amazon_price'] as String,
      coolstuffinc_price: json['coolstuffinc_price'] as String,
    );
  }

  Map<String, dynamic> toJson() => {
        "cardmarket_price": cardmarket_price,
        "tcgplayer_price": tcgplayer_price,
        "ebay_price": ebay_price,
        "amazon_price": amazon_price,
        "coolstuffinc_price": coolstuffinc_price,
      };
}
