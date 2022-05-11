import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/model/Manager/card_shopp_manager.dart';
import 'package:provider/provider.dart';

class PriceCard extends StatefulWidget {
  PriceCard({this.buttonText, this.onPressed});

  final String buttonText;
  final VoidCallback onPressed;

  @override
  State<PriceCard> createState() => _PriceCardState();
}

class _PriceCardState extends State<PriceCard> {
  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final cartManager = context.watch<CartShoppManager>();
    final productsPrice = cartManager.productsPrice;
    final deliveryPrice = cartManager.deliveryPrice;
    final totalPrice = cartManager.totalPrice;

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              'Resumo do Pedido',
              textAlign: TextAlign.start,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 24,
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                const Text('Subtotal',
                    style: TextStyle(
                      fontSize: 20,
                    )),
                Text(
                    'R\$ ${productsPrice.toStringAsFixed(2).replaceAll('.', ',')}',
                    style: TextStyle(
                      fontSize: 20,
                    ))
              ],
            ),
            const Divider(),
            const SizedBox(
              height: 10,
            ),
            if (deliveryPrice != null) ...[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Frete',
                    style: const TextStyle(
                      color: Colors.green,
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    'R\$ ${deliveryPrice}',
                    style: const TextStyle(
                      color: Colors.green,
                      fontSize: 20,
                    ),
                  )
                ],
              ),
            ],
            const SizedBox(
              height: 10,
            ),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Total',
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
                ),
                Text(
                  'R\$${totalPrice.toStringAsFixed(2).replaceAll('.', ',')}',
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 20,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            RaisedButton(
              color: Theme.of(context).primaryColor,
              disabledColor: Theme.of(context).primaryColor.withAlpha(100),
              textColor: Colors.white,
              onPressed: widget.onPressed,
              child: Text(
                widget.buttonText,
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
