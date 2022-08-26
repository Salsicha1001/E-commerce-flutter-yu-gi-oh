import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/generated/l10n.dart';
import 'package:flutter_ecommerce/helpers/dolar-real.dart';
import 'package:flutter_ecommerce/model/Manager/config_manager.dart';
import 'package:flutter_ecommerce/model/card/cards_prices.dart';
import 'package:provider/provider.dart';

class PriceDetail extends StatefulWidget {
  CardsPrices price;
  PriceDetail({this.price});

  @override
  State<PriceDetail> createState() => _PriceDetailState();
}

class _PriceDetailState extends State<PriceDetail> {
  String priceTotal;
  @override
  Future<void> didChangeDependencies() async {
    super.didChangeDependencies();
    if (Provider.of<ThemeAppConfig>(context).getLocale == Locale('pt', 'BR')) {
      double valueDolar = await DolarToReal.getReal() as double;
      widget.price.amazon_price =
          (double.parse(widget.price.amazon_price) * valueDolar)
              .toStringAsFixed(2);
      widget.price.cardmarket_price =
          (double.parse(widget.price.cardmarket_price) * valueDolar)
              .toStringAsFixed(2);
      widget.price.ebay_price =
          (double.parse(widget.price.ebay_price) * valueDolar)
              .toStringAsFixed(2);
      widget.price.tcgplayer_price =
          (double.parse(widget.price.tcgplayer_price) * valueDolar)
              .toStringAsFixed(2);
    }
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
                  LocaleProvider.of(context).preco_ebay,
                  style: TextStyle(fontSize: 18),
                ),
                flex: 2,
              ),
              Expanded(
                child: Text(LocaleProvider.of(context).preco_Amazon,
                    style: TextStyle(fontSize: 18)),
                flex: 2,
              )
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Text(
                    "${LocaleProvider.of(context).coin}  ${widget.price.ebay_price}",
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                flex: 2,
              ),
              Expanded(
                child: Text(
                    "${LocaleProvider.of(context).coin}  ${widget.price.amazon_price}",
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
                  LocaleProvider.of(context).preco_TCGPLAYER,
                  style: TextStyle(fontSize: 17),
                ),
                flex: 2,
              ),
              Expanded(
                child: Text(LocaleProvider.of(context).preco_CARDMARKET,
                    style: TextStyle(fontSize: 17)),
                flex: 2,
              )
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Text(
                    "${LocaleProvider.of(context).coin}  ${widget.price.tcgplayer_price}",
                    style:
                        TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
                flex: 2,
              ),
              Expanded(
                child: Text(
                    "${LocaleProvider.of(context).coin}  ${widget.price.cardmarket_price}",
                    style:
                        TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
                flex: 2,
              )
            ],
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}
