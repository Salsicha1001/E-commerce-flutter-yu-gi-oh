import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/Commons/Custom_Drawer/custom_drawer.dart';
import 'package:flutter_ecommerce/Commons/Custom_Drawer/empty_cart.dart';
import 'package:flutter_ecommerce/Screens/Shoop/price_cart.dart';
import 'package:flutter_ecommerce/Screens/Shoop/cart_tile.dart';
import 'package:flutter_ecommerce/Screens/Users/login_screen.dart';
import 'package:flutter_ecommerce/model/Manager/card_shopp_manager.dart';
import 'package:flutter_ecommerce/model/user_model.dart';
import 'package:provider/provider.dart';

class CartShoopScreen extends StatefulWidget {
  @override
  State<CartShoopScreen> createState() => _CartShoopScreenState();
  
}

class _CartShoopScreenState extends State<CartShoopScreen> {

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
          return  const EmptyCard(
            iconData: Icons.remove_shopping_cart,
            title: 'Nenhum produto no carrinho!',
          );
        }else{
            return ListView(
            children: <Widget>[
              Column(
                children: cartManager.list.map(
                        (cartProduct) => CartTile(cart: cartProduct)
                ).toList(),
              ),
                PriceCard(
                buttonText: 'Continuar para Entrega',
                onPressed: (){
                  Navigator.of(context).pushNamed('/address');
                } ,
              ),
            ]);
        }
      }),
    );
  }
}
