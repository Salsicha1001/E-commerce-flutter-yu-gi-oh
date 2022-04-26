import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/model/Manager/card_shopp_manager.dart';
import 'package:flutter_ecommerce/model/card/card_detail_dto.dart';
import 'package:flutter_ecommerce/model/card/cards_list.dart';
import 'package:flutter_ecommerce/model/cart_shopp.dart';
import 'package:flutter_ecommerce/services/card_service.dart';
import 'package:provider/provider.dart';

class CartTile extends StatefulWidget {
  CartTile({this.cart, this.cartProduct});
  final CartShopp cart;
  final CartShoppManager cartProduct;

  @override
  State<CartTile> createState() => _CartTileState();
}

class _CartTileState extends State<CartTile> {
  int qty;
  double totalCardItem;
  @override
  void initState() {
    updateValue();
    qty = widget.cart.qty;
    super.initState();
  }

  updateValue() {
    totalCardItem = widget.cart.price * widget.cart.qty;
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: widget.cartProduct,
      child: GestureDetector(
        onTap: () async {
          List<CardList> cards;
          CardDetailDto dto =
              await CardService().getCardByName(context, widget.cart.name_card);
          if (dto.archetype != null) {
            cards = await CardService()
                .getCardByArctype(context, widget.cart.arcthype);
          }
          if (dto.id != null) {
            Navigator.of(context)
                .pushNamed("/detail-card", arguments: [dto, cards]);
          }
        },
        child: Card(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              children: <Widget>[
                SizedBox(
                  height: 150,
                  width: 100,
                  child: Image.network(widget.cart.img_card),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          widget.cart.name_card,
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 18.0,
                          ),
                        ),
                        Text(
                          'R\$ ${totalCardItem.toStringAsFixed(2)}',
                          style: TextStyle(
                              color: Color.fromARGB(255, 7, 233, 233),
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                ),
                Column(
                  children: <Widget>[
                    IconButton(
                        onPressed: () async {
                          setState(() {
                            qty++;
                            widget.cart.qty = qty;
                            updateValue();
                          });
                          Provider.of<CartShoppManager>(context, listen: false)
                              .addItemCart(widget.cart);
                        },
                        iconSize: 50,
                        icon: const Icon(Icons.add),
                        color: Color.fromARGB(255, 71, 191, 238)),
                    Text(
                      '$qty',
                      style: const TextStyle(fontSize: 20),
                    ),
                    IconButton(
                        onPressed: () {
                            setState(() {
                              qty--;
                              widget.cart.qty = qty;
                              updateValue();
                            });
                         Provider.of<CartShoppManager>(context,
                                      listen: false)
                                  .removeItemCart(widget.cart);
                        },
                        iconSize: 50,
                        icon: const Icon(Icons.remove),
                        color: Color.fromARGB(255, 71, 191, 238)),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
