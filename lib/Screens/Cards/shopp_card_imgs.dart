import 'dart:developer';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/model/Manager/card_shopp_manager.dart';
import 'package:flutter_ecommerce/model/card/card_detail_dto.dart';
import 'package:flutter_ecommerce/model/cart_shopp.dart';
import 'package:provider/provider.dart';

class DialogCardSelect extends StatefulWidget {
  List<String> images;
  CardDetailDto cardDto;
  DialogCardSelect({this.images, this.cardDto});
  @override
  State<DialogCardSelect> createState() => _DialogCardSelectState();
}

class _DialogCardSelectState extends State<DialogCardSelect> {
  int qty = 1;
  int i = 0;

  addCard() {
    double myPrice = (double.parse(widget.cardDto.card_prices[0].amazon_price) +
        double.parse(widget.cardDto.card_prices[0].cardmarket_price) +
        double.parse(widget.cardDto.card_prices[0].ebay_price) +
        double.parse(widget.cardDto.card_prices[0].tcgplayer_price));
    myPrice = myPrice / 4;
    myPrice = double.parse(myPrice.toStringAsFixed(2));
    CartShopp card = CartShopp(
        id_card: widget.cardDto.id.toString(),
        img_card: widget.images[i],
        name_card: widget.cardDto.name,
        price: myPrice,
        qty: qty,
        arcthype: widget.cardDto.archetype);
    Provider.of<CartShoppManager>(context, listen: false).addItemCart(card);
    Navigator.of(context).pop();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: widget.images.length > 0
            ? DefaultTextStyle(
                style: const TextStyle(
                  fontSize: 24,
                  fontFamily: 'Bobbers',
                ),
                child: AnimatedTextKit(
                  animatedTexts: [
                    TyperAnimatedText(
                        'Escolha um card para adicionar no carrinho.')
                  ],
                  repeatForever: true,
                ))
            : Text("Adicionar o card no carrinho."),
      ),
      body: Column(
        children: [
          Expanded(
            child: Swiper(
              layout: SwiperLayout.TINDER,
              onIndexChanged: (iws) {
                i = iws;
              },
              itemBuilder: (context, index) {
                final img = widget.images[index];
                // i = index;
                return Image.network(
                  img,
                );
              },
              itemCount: widget.images.length,
              itemWidth: MediaQuery.of(context).size.width,
              itemHeight: MediaQuery.of(context).size.height,
              physics: const ScrollPhysics(),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                  onPressed: () {
                    setState(() {
                      if (qty != 1) {
                        qty--;
                      }
                    });
                  },
                  iconSize: 50,
                  icon: const Icon(Icons.remove),
                  color: Color.fromARGB(255, 71, 191, 238)),
              Text(
                '$qty',
                style: TextStyle(
                    color: Color.fromARGB(255, 71, 191, 238), fontSize: 24),
              ),
              IconButton(
                  onPressed: () {
                    setState(() {
                      qty++;
                    });
                  },
                  iconSize: 50,
                  icon: const Icon(Icons.add),
                  color: Color.fromARGB(255, 71, 191, 238)),
            ],
          ),
          RaisedButton(
            onPressed: () {
              addCard();
            },
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(80.0)),
            padding: const EdgeInsets.all(0.0),
            child: Ink(
              decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      Color.fromARGB(255, 50, 122, 230),
                      Color.fromARGB(255, 71, 191, 238)
                    ],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                  borderRadius: BorderRadius.circular(30.0)),
              child: Container(
                constraints:
                    const BoxConstraints(maxWidth: 250.0, minHeight: 50.0),
                alignment: Alignment.center,
                child: const Text(
                  "Escolher Esse",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
