import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/Screens/Shoop/cart_tile.dart';
import 'package:flutter_ecommerce/model/cart_shopp.dart';

class OrdesDetails extends StatelessWidget {
  List<CartShopp> card;
   OrdesDetails({this.card});

  @override
  Widget build(BuildContext context) {
   return Scaffold(
        appBar: AppBar(
          title: const Text("Detalhes da cartas"),
        ),
        body: 
           ListView(children: [
            Column(
              children: card
                  .map((cartProduct) => CartTile(cart: cartProduct,showDetail: true,))
                  .toList(),
            ),
          ])
        );
  }
}