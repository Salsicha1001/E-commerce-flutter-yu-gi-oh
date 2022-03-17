import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/Commons/Custom_Drawer/custom_drawer.dart';
import 'package:flutter_ecommerce/Screens/Cards/card_content.dart';

class CardsScreen extends StatefulWidget {
  @override
  State<CardsScreen> createState() => _CardsScreenState();
}

class _CardsScreenState extends State<CardsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(title: const Text("Cartas")),
      body: Container(
          margin: const EdgeInsets.all(8.0),
          child: Card(
            child: ListView(
              children: [
                CardContent()
              ],
            ),
          )),
    );
  }
}
