import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/Commons/Custom_Drawer/custom_drawer.dart';
import 'package:flutter_ecommerce/Components/dialog_custom.dart';
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
  FilterCardRequest request =
      FilterCardRequest(fname: '', attribute: '', race: '', type: '');
  bool filter = false;
  String _searchText = "";
  Icon _searchIcon = const Icon(Icons.search);
  Widget _appBarTitle;
  final TextEditingController _filter = TextEditingController();
  int page = 0;
  final RefreshController refreshController = RefreshController();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    getCards();
  }

  Future<bool> getCards({bool isRefresh = false}) async {
    if (page > 20 && cards.length % 2 != 0) {
      refreshController.refreshFailed();
      return false;
    }
    if (!filter) {
      if (isRefresh || page < 20) {
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

      List<CardList> cd =
          await CardService().getCardByFilter(context, request, page);
      if (cd != null) {
        setState(() {
          if (isRefresh) {
            cards = cd;
          } else {
            cards.addAll(cd);
          }
          page = page + 20;
          Timer(const Duration(seconds: 1), () {
            LoadCustom().closeLoad();
            refreshController.loadComplete();
          });
        });
        return true;
      } else {
        DialogsCustom().showDialogAlert(LocaleProvider.of(context).shit,
            context, LocaleProvider.of(context).Could_not_find_these_cards);
        return false;
      }
    }
  }

  Future openDialog() async {
    String open = await Navigator.of(context)
        .push(MaterialPageRoute<FilterCardRequest>(
            builder: (BuildContext context) {
              return FilterCard.add(request);
            },
            fullscreenDialog: true))
        // ignore: missing_return
        .then((value) {
      if (value != null) {
        request = value;
        if (request.attribute != "" ||
            request.race != "" ||
            request.type != "") {
          filter = true;
        }
      }
      getCards(
        isRefresh: true,
      );
    });
  }

  void _searchPressed() {
    setState(() {
      if (this._searchIcon.icon == Icons.search) {
        this._searchIcon = const Icon(Icons.close);
        this._appBarTitle = TextField(
          controller: _filter,
          decoration: const InputDecoration(
            prefixIcon: Icon(Icons.search, color: Colors.white),
            hintText: "Search...",
            hintStyle: TextStyle(color: Colors.white),
          ),
          style: const TextStyle(color: Colors.white),
          onSubmitted: (getByCard) {
            setState(() {
              if (getByCard.isNotEmpty) {
                request = FilterCardRequest(
                    fname: getByCard,
                    attribute: request.attribute != '' ? request.attribute : '',
                    race: request.race != '' ? request.race : '',
                    type: request.type != '' ? request.type : '');
                filter = true;
                getCards(
                  isRefresh: true,
                );
              } else {
                request = FilterCardRequest();
                filter = false;
                getCards();
              }
            });
          },
        );
      } else {
        this._searchIcon = const Icon(Icons.search);
        this._appBarTitle = Text(LocaleProvider.of(context).cards);
        _filter.clear();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        drawer: CustomDrawer(),
        appBar: AppBar(title: _appBarTitle, actions: [
          IconButton(
            icon: _searchIcon,
            onPressed: _searchPressed,
          ),
        ]),
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
                page = cards.length;
                refreshController.refreshFailed();
              }
            },
            onLoading: () async {
              final res = await getCards();
              if (res) {
                refreshController.refreshCompleted();
              } else {
                page = cards.length;
                refreshController.loadFailed();
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
          backgroundColor: const Color.fromARGB(255, 0, 36, 155),
        ));
  }
}
