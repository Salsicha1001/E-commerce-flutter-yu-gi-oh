import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/model/card/cards_prices.dart';

class PriceDetail extends StatefulWidget {
  CardsPrices price;
  PriceDetail({this.price});

  @override
  State<PriceDetail> createState() => _PriceDetailState();
}

class _PriceDetailState extends State<PriceDetail> {
  String priceTotal;
  @override
  void initState() {
    double myPrice;
    myPrice = (double.parse(widget.price.amazon_price) +
        double.parse(widget.price.cardmarket_price) +
        double.parse(widget.price.ebay_price) +
        double.parse(widget.price.tcgplayer_price));
    myPrice = myPrice /10;
    priceTotal = myPrice.toStringAsFixed(2);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      child: ListView(
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  "Preço na Ebay",
                  style: TextStyle(fontSize: 18),
                ),
                flex: 2,
              ),
              Expanded(
                child: Text("Preço na Amazon", style: TextStyle(fontSize: 18)),
                flex: 2,
              )
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Text("R\$ ${widget.price.ebay_price}",
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                flex: 2,
              ),
              Expanded(
                child: Text("R\$ ${widget.price.amazon_price}",
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                flex: 2,
              )
            ],
          ),
          const SizedBox(height: 30),
          Row(
            children: [
              Expanded(
                child: Text(
                  "Preço na TCGPLAYER",
                  style: TextStyle(fontSize: 17),
                ),
                flex: 2,
              ),
              Expanded(
                child:
                    Text("Preço na CARDMARKET", style: TextStyle(fontSize: 17)),
                flex: 2,
              )
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Text("R\$ ${widget.price.tcgplayer_price}",
                    style:
                        TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
                flex: 2,
              ),
              Expanded(
                child: Text("R\$ ${widget.price.cardmarket_price}",
                    style:
                        TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
                flex: 2,
              )
            ],
          ),
          const SizedBox(height: 30),
          Row(
            children: [
              Expanded(
                child: Text(
                  "Preço na Loja",
                  style: TextStyle(fontSize: 20),
                  textAlign: TextAlign.center,
                ),
                flex: 5,
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Text(
                  "R\$${priceTotal}",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                flex: 5,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
