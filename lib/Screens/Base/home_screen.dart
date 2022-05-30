import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/Commons/Custom_Drawer/custom_drawer.dart';
import 'package:flutter_ecommerce/Screens/Cards/card_content.dart';
import 'package:flutter_ecommerce/model/card/cards_list.dart';
import 'package:flutter_ecommerce/services/card_service.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<CardList> cards = [];
  @override
  void initState() {
    getCardsRecomand(context);
    super.initState();
  }

  getCardsRecomand(context) async {
    List<CardList> cd = await CardService().getCardRecomend(context);
    if (cd != null) {
      setState(() {
        cards = cd;
      });
      return true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
        title: const Text('Home/ Cartas Recomendadas'),
        centerTitle: true,
      ),
      body: Card(
        child: ListView(
          children: [
            GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 5.0,
                  mainAxisExtent: 280),
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              physics: const ScrollPhysics(),
              itemCount: cards.length,
              itemBuilder: (context, index) => CardContent(
                cardList: cards[index],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
