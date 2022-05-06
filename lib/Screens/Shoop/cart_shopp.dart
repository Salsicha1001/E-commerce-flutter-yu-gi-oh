import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/Commons/Custom_Drawer/custom_drawer.dart';
import 'package:flutter_ecommerce/Commons/Custom_Drawer/empty_cart.dart';
import 'package:flutter_ecommerce/Components/load_custom.dart';
import 'package:flutter_ecommerce/Screens/Cards/animation_card.dart';
import 'package:flutter_ecommerce/Screens/Shoop/cred_card.dart';
import 'package:flutter_ecommerce/Screens/Shoop/price_cart.dart';
import 'package:flutter_ecommerce/Screens/Shoop/cart_tile.dart';
import 'package:flutter_ecommerce/Screens/Users/login_screen.dart';
import 'package:flutter_ecommerce/Utils/validate_animations.dart';
import 'package:flutter_ecommerce/model/Manager/card_shopp_manager.dart';
import 'package:flutter_ecommerce/model/cart_shopp.dart';
import 'package:flutter_ecommerce/model/payament/cred-card.model.dart';
import 'package:flutter_ecommerce/model/user_model.dart';
import 'package:flutter_ecommerce/services/payament_service.dart';
import 'package:provider/provider.dart';

class CartShoopScreen extends StatefulWidget {
  @override
  State<CartShoopScreen> createState() => _CartShoopScreenState();
}

class _CartShoopScreenState extends State<CartShoopScreen> {
  @override
  void initState() {
    super.initState();
  }

  Future getCredCards() async {
    LoadCustom().openLoadMsg("Prosseguindo..");
    List<CredCart> list = await OrderPayament().getCredCards(context);
    LoadCustom().closeLoad();
    Navigator.of(context).pushNamed('/list_creds', arguments: list);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
        title: const Text('Carrinho'),
        centerTitle: true,
      ),
      body: Consumer<CartShoppManager>(builder: (_, cartManager, __) {
        if (!Provider.of<UserManager>(context).isLoggedIn) {
          return LoginScreen();
        }

        if (cartManager.list.isEmpty) {
          return const EmptyCard(
            iconData: Icons.remove_shopping_cart,
            title: 'Nenhum produto no carrinho!',
          );
        } else {
          return ListView(children: <Widget>[
            Column(
              children: cartManager.list
                  .map((cartProduct) => CartTile(cart: cartProduct))
                  .toList(),
            ),
            PriceCard(
              buttonText: 'Continuar para Entrega',
              onPressed: () async {
                getCredCards();
                // String open = await Navigator.of(context)
                //     .push(MaterialPageRoute(
                //         builder: (BuildContext context) {
                //           return CredCardScreen();
                //         },
                //         fullscreenDialog: true))
                //     // ignore: missing_return
                //     .then((value) {});
              },
            ),
          ]);
        }
      }),
    );
  }
}
