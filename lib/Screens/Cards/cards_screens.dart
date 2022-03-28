import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/Commons/Custom_Drawer/custom_drawer.dart';
import 'package:flutter_ecommerce/Components/load_custom.dart';
import 'package:flutter_ecommerce/Screens/Cards/Filter/filter_card.dart';
import 'package:flutter_ecommerce/Screens/Cards/card_content.dart';
import 'package:flutter_ecommerce/generated/l10n.dart';
import 'package:flutter_ecommerce/model/card/cards_list.dart';
import 'package:flutter_ecommerce/model/card/filter_request_card.dart';
import 'package:flutter_ecommerce/services/card_service.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class CardsScreen extends StatefulWidget {
  @override
  State<CardsScreen> createState() => _CardsScreenState();
}

class _CardsScreenState extends State<CardsScreen> {
  get hei => MediaQuery.of(context).size.height;
  List<CardList> cards = [];
  FilterCardRequest request;
  bool filter = false;
  int page = 0;
  final RefreshController refreshController = RefreshController();
  @override
  void initState() {
    getCards();
    super.initState();
  }

  Future<bool> getCards({bool isRefresh = false}) async {
    if (!filter) {
      if (isRefresh) {
        page = 0;
      }
      List<CardList> card =
          await CardService().getCardPagination(context, page);
      setState(() {
        if (isRefresh) {
          cards = card;
        } else {
          cards.addAll(card);
        }
        page = page + 20;
        Timer(const Duration(seconds: 1), () {
          LoadCustom().closeLoad();
          refreshController.loadComplete();
        });
      });
      return true;
    } else {
      if (isRefresh) {
        page = 0;
      }
      List<CardList> card =
          await CardService().getCardByFilter(context, request, page);
      setState(() {
        if (card != null) {
          if (isRefresh) {
            cards = card;
          } else {
            cards.addAll(card);
          }
          page = page + 20;
          Timer(const Duration(seconds: 1), () {
            LoadCustom().closeLoad();
            refreshController.loadComplete();
          });
          return true;
        } else {
          return false;
        }
      });
    }
  }

  Future openDialog() async {
    String open = await Navigator.of(context)
        .push(new MaterialPageRoute<FilterCardRequest>(
            builder: (BuildContext context) {
              return new FilterCard.add(request);
            },
            fullscreenDialog: true))
        .then((value) {
      request = value;
      if (request.attribute != "" || request.race != "" || request.type != "") {
        filter = true;
      }
      getCards(isRefresh: true);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: CustomDrawer(),
        appBar: AppBar(title: Text(LocaleProvider.of(context).cards)),
        body: Card(
          margin: const EdgeInsets.all(8.0),
          child: SmartRefresher(
            controller: refreshController,
            enablePullUp: true,
            onRefresh: () async {
              final res = await getCards(isRefresh: true);
              if (res) {
                refreshController.refreshCompleted();
              } else {
                refreshController.refreshFailed();
              }
            },
            onLoading: () async {
              final res = await getCards();
              if (res) {
                refreshController.refreshCompleted();
              } else {
                refreshController.refreshFailed();
              }
            },
            child: ListView(
              children: <Widget>[
                Container(
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
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
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            openDialog();
          },
          elevation: 10.0,
          child: const Icon(Icons.filter_alt_outlined),
          backgroundColor: Color.fromARGB(255, 0, 36, 155),
        ));
  }
}
