import 'dart:developer';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/Screens/Cards/animation_card.dart';
import 'package:flutter_ecommerce/Screens/Cards/card_content.dart';
import 'package:flutter_ecommerce/Screens/Cards/detail_image.dart';
import 'package:flutter_ecommerce/Screens/Cards/detail_price.dart';
import 'package:flutter_ecommerce/Utils/validate_animations.dart';
import 'package:flutter_ecommerce/generated/l10n.dart';
import 'package:flutter_ecommerce/helpers/dolar-real.dart';
import 'package:flutter_ecommerce/model/Manager/config_manager.dart';
import 'package:flutter_ecommerce/model/card/card_detail_dto.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter_ecommerce/model/card/cards_list.dart';
import 'package:provider/provider.dart';
import 'package:tab_container/tab_container.dart';

class CardDetail extends StatefulWidget {
  CardDetailDto card;
  List<CardList> list_cards = [];
  CardDetail(this.card, this.list_cards, {Key key}) : super(key: key);
  @override
  State<CardDetail> createState() => _CardDetailState();
}

class _CardDetailState extends State<CardDetail> {
  List<String> images = [];

  @override
  void initState() {
    _createCarousel();
    super.initState();
  }

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    if (Provider.of<ThemeAppConfig>(context).getLocale == Locale('pt', 'BR')) {
       DolarEuro value = await DolarToReal.getReal();
      widget.card.card_prices[0].amazon_price =
          (double.parse(widget.card.card_prices[0].amazon_price) * value.dolar)
              .toStringAsFixed(2);
      widget.card.card_prices[0].cardmarket_price =
          (double.parse(widget.card.card_prices[0].cardmarket_price) *
                  value.euro)
              .toStringAsFixed(2);
      widget.card.card_prices[0].ebay_price =
          (double.parse(widget.card.card_prices[0].ebay_price) * value.dolar)
              .toStringAsFixed(2);
      widget.card.card_prices[0].tcgplayer_price =
          (double.parse(widget.card.card_prices[0].tcgplayer_price) *
                  value.dolar)
              .toStringAsFixed(2);
    }
  }

  _createCarousel() {
    if (widget.card.card_images.isNotEmpty) {
      for (var image in widget.card.card_images) {
        images.add(image.image_url);
      }
    }
    if (widget.list_cards != null) {
      final card =
          widget.list_cards.indexWhere((card) => card.id == widget.card.id);
      if (card != -1) {
        widget.list_cards.removeAt(card);
      }
    }
  }

  List<String> _getTabs2() {
    return <String>[
      LocaleProvider.of(context).description,
      LocaleProvider.of(context).prices,
      if (widget.list_cards != null)
        LocaleProvider.of(context).carrelated_letterds
    ];
  }

  Future openDialog(element) async {
    String open = await Navigator.of(context)
        .push(MaterialPageRoute<void>(
            builder: (BuildContext context) {
              return AnimationCard(
                  video: getAnimation(
                      element != '' ? element : widget.card.name, context));
            },
            fullscreenDialog: true))
        .then((value) {});
  }

  List<Color> _getColors() {
    return [
      Color.fromARGB(255, 30, 101, 182),
      Color.fromARGB(255, 30, 101, 182),
      if (widget.list_cards != null) Color.fromARGB(255, 30, 101, 182),
    ];
  }

  List<Widget> _getChildren2() {
    return [
      ListView(
        children: [
          Container(
            padding: const EdgeInsets.all(8.0),
            child: Row(children: [
              if (widget.card.level > 0)
                const Text("Level:",
                    style: const TextStyle(fontSize: 20, color: Colors.white)),
              for (int i = 0; i < widget.card.level; i++)
                Image.asset(
                  'images/img_star.png',
                  height: 23,
                )
            ]),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(8, 8, 0, 0),
            child: Row(children: [
              Expanded(
                  flex: 2,
                  child: Wrap(children: [
                    Text(LocaleProvider.of(context).type_card + ':',
                        style: TextStyle(fontSize: 20, color: Colors.white)),
                  ])),
              Expanded(
                  flex: 2,
                  child: Wrap(
                    children: [
                      Text(LocaleProvider.of(context).type + ':',
                          style: const TextStyle(
                              fontSize: 20, color: Colors.white)),
                    ],
                  )),
            ]),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
            child: Row(children: [
              Expanded(
                  flex: 2,
                  child: Wrap(children: [
                    Text("${widget.card.type}",
                        style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white)),
                  ])),
              Expanded(
                  flex: 2,
                  child: Wrap(
                    children: [
                      Text("${widget.card.race}",
                          style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
                    ],
                  )),
            ]),
          ),
          if (widget.card.type.contains("Monstro") ||
              widget.card.type.contains("Monster"))
            Container(
              padding: const EdgeInsets.fromLTRB(8, 8, 0, 0),
              child: Row(children: [
                Expanded(
                    flex: 1,
                    child: Wrap(children: [
                      Text(LocaleProvider.of(context).attack + ':',
                          style: const TextStyle(
                              fontSize: 20, color: Colors.white)),
                    ])),
                Expanded(
                    flex: 1,
                    child: Wrap(
                      children: [
                        Text(LocaleProvider.of(context).defense + ':',
                            style: const TextStyle(
                                fontSize: 20, color: Colors.white)),
                      ],
                    )),
                if (widget.card.attribute != null)
                  Expanded(
                      flex: 1,
                      child: Wrap(
                        children: [
                          Text(LocaleProvider.of(context).attribute + ':',
                              style: const TextStyle(
                                  fontSize: 20, color: Colors.white)),
                        ],
                      )),
              ]),
            ),
          if (widget.card.type.contains("Monstro") ||
              widget.card.type.contains("Monster"))
            Container(
              padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
              child: Row(children: [
                Expanded(
                    flex: 1,
                    child: Wrap(children: [
                      Text("${widget.card.atk}",
                          style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
                    ])),
                Expanded(
                    flex: 1,
                    child: Wrap(
                      children: [
                        Text("${widget.card.def}",
                            style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white)),
                      ],
                    )),
                if (widget.card.attribute != null)
                  Expanded(
                      flex: 1,
                      child: Wrap(
                        children: [
                          Text("${widget.card.attribute}",
                              style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white)),
                        ],
                      )),
              ]),
            ),
          const SizedBox(height: 20),
          Text(
            LocaleProvider.of(context).description,
            style: const TextStyle(fontSize: 20, color: Colors.white),
            textAlign: TextAlign.center,
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(8, 8, 0, 30),
            child: Wrap(children: [
              Text(
                "${widget.card.desc}",
                style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              )
            ]),
          ),
        ],
      ),
      PriceDetail(price: widget.card.card_prices[0]),
      if (widget.list_cards != null)
        Card(
          color: Color.fromARGB(255, 30, 101, 182),
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount:3,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 5.0,
                mainAxisExtent: 140),
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            physics: const ScrollPhysics(),
            itemCount: widget.list_cards.length,
            itemBuilder: (context, index) => CardContent(
              cardList: widget.list_cards[index],
            ),
          ),
        ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: DefaultTextStyle(
            style: const TextStyle(
                fontSize: 20, fontFamily: 'Bobbers', color: Colors.white),
            child: AnimatedTextKit(
              animatedTexts: [TyperAnimatedText('${widget.card.name}')],
              repeatForever: true,
            )),
        actions: [
          if (getAnimation(widget.card.name, context) != null)
            IconButton(
              icon: const Icon(Icons.man_rounded),
              onPressed: () {
                openDialog('');
              },
            ),
        ],
      ),
      body: Card(
          color: Color.fromARGB(255, 92, 129, 199),
          child: Container(
              child: Column(children: <Widget>[
            Expanded(
              child: Swiper(
                  itemBuilder: (context, index) {
                    final img = images[index];
                    return FadeInImage.assetNetwork(
                      image: img,
                      placeholder: 'images/load.gif',
                      alignment: Alignment.topCenter,
                    );
                  },
                  itemCount: images.length,
                  autoplay: true,
                  autoplayDisableOnInteraction: true,
                  duration: 1500,
                  physics: const ScrollPhysics(),
                  onTap: (img) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return DetailScreen(images[img]);
                    }));
                  },
                  loop: images.length > 1 ? true : false),
            ),
            Expanded(
                child: ListView(
              shrinkWrap: true,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.5,
                  child: AspectRatio(
                    aspectRatio: 10 / 8,
                    child: TabContainer(
                      radius: 25,
                      tabEdge: TabEdge.top,
                      tabCurve: Curves.easeInSine,
                      transitionBuilder: (child, animation) {
                        animation = CurvedAnimation(
                            curve: Curves.easeIn, parent: animation);
                        return SlideTransition(
                          position: Tween(
                            begin: const Offset(0.2, 0.0),
                            end: const Offset(0.0, 0.0),
                          ).animate(animation),
                          child: FadeTransition(
                            opacity: animation,
                            child: child,
                          ),
                        );
                      },
                      children: _getChildren2(),
                      tabs: _getTabs2(),
                      colors: _getColors(),
                      selectedTextStyle: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                      unselectedTextStyle:
                          const TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ))
          ]))),
    );
  }
}
