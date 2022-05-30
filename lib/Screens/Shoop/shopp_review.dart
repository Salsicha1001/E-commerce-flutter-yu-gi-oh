import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/Components/load_custom.dart';
import 'package:flutter_ecommerce/Screens/Shoop/cart_tile.dart';
import 'package:flutter_ecommerce/Screens/Shoop/price_cart.dart';
import 'package:flutter_ecommerce/model/Manager/card_shopp_manager.dart';
import 'package:flutter_ecommerce/model/cart_shopp.dart';
import 'package:flutter_ecommerce/model/order_request.dart';
import 'package:flutter_ecommerce/model/payament/cred-card.model.dart';
import 'package:flutter_ecommerce/services/payament_service.dart';
import 'package:provider/provider.dart';

class ShoppReview extends StatefulWidget {
  CredCart credCart;
  ShoppReview(this.credCart);
  @override
  State<ShoppReview> createState() => _ShoppReviewState();
}

class _ShoppReviewState extends State<ShoppReview> {
  submit(List<CartShopp> list) async {
    LoadCustom().openLoadMsg("Finalizando a compra");
    OrderRequest request = new OrderRequest(
        id_credCard: widget.credCart.id_card, listOrders: list);
    await OrderPayament().saveOrder(context, request);
    LoadCustom().closeLoad();
    Provider.of<CartShoppManager>(context, listen: false).clearCard();
    Navigator.of(context)
        .pushNamedAndRemoveUntil('/', (Route<dynamic> route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Confirmação"),
        ),
        body: Consumer<CartShoppManager>(builder: (_, cartManager, __) {
          return ListView(children: [
            Column(
              children: cartManager.list
                  .map((cartProduct) => CartTile(cart: cartProduct,showDetail: true,))
                  .toList(),
            ),
            PriceCard(
                buttonText: "Comprar",
                onPressed: () async {
                  setState(() {
                    submit(cartManager.list);
                  });
                })
          ]);
        }));
  }
}
