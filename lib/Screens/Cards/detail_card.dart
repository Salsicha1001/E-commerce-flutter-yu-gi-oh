import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/Screens/Cards/animation_card.dart';
import 'package:flutter_ecommerce/Screens/Cards/card_content.dart';
import 'package:flutter_ecommerce/Screens/Cards/detail_image.dart';
import 'package:flutter_ecommerce/Screens/Cards/detail_price.dart';
import 'package:flutter_ecommerce/Screens/Cards/shopp_card_imgs.dart';
import 'package:flutter_ecommerce/Utils/validate_animations.dart';
import 'package:flutter_ecommerce/generated/l10n.dart';
import 'package:flutter_ecommerce/model/card/card_detail_dto.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter_ecommerce/model/card/cards_list.dart';
import 'package:flutter_ecommerce/model/user_model.dart';
import 'package:provider/provider.dart';
import 'package:tab_container/tab_container.dart';

class CardDetail extends StatefulWidget {
  CardDetailDto card;
  List<CardList> list_cards;
  CardDetail(this.card, this.list_cards, {Key key}) : super(key: key);
  @override
  State<CardDetail> createState() => _CardDetailState();
}

class _CardDetailState extends State<CardDetail> {
  List<String> images = [];

  @override
  void initState() {
    super.initState();
    _createCarousel();
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
    if (widget.card.archetype != null) {
      return <String>[
        LocaleProvider.of(context).description,
        LocaleProvider.of(context).prices,
        LocaleProvider.of(context).carrelated_letterds
      ];
    } else {
      return <String>[
        LocaleProvider.of(context).description,
        LocaleProvider.of(context).prices
      ];
    }
  }

  Future openDialog() async {
    String open = await Navigator.of(context)
        .push(MaterialPageRoute<void>(
            builder: (BuildContext context) {
              return AnimationCard(
                  video: getAnimation(widget.card.name, context));
            },
            fullscreenDialog: true))
        .then((value) {});
  }

 Future openDialogShoop() async{
     String open = await Navigator.of(context)
        .push(MaterialPageRoute<void>(
            builder: (BuildContext context) {
              return DialogCardSelect(
                  images:images,cardDto: widget.card,);
            },
            fullscreenDialog: true))
        .then((value) {});
  }

  List<Widget> _getChildren2() {
    if (widget.card.archetype == null) {
      return <Widget>[
        ListView(
          children: [
            Container(
              padding: const EdgeInsets.all(8.0),
              child: Row(children: [
                if (widget.card.level > 0)
                  const Text("Level:", style: TextStyle(fontSize: 20)),
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
                          style: const TextStyle(fontSize: 20)),
                    ])),
                Expanded(
                    flex: 2,
                    child: Wrap(
                      children: [
                        Text(LocaleProvider.of(context).type + ':',
                            style: const TextStyle(fontSize: 20)),
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
                              fontSize: 20, fontWeight: FontWeight.bold)),
                    ])),
                Expanded(
                    flex: 2,
                    child: Wrap(
                      children: [
                        Text("${widget.card.race}",
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
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
                            style: const TextStyle(fontSize: 20)),
                      ])),
                  Expanded(
                      flex: 1,
                      child: Wrap(
                        children: [
                          Text(LocaleProvider.of(context).defense + ':',
                              style: const TextStyle(fontSize: 20)),
                        ],
                      )),
                  if (widget.card.attribute != null)
                    Expanded(
                        flex: 1,
                        child: Wrap(
                          children: [
                            Text(LocaleProvider.of(context).attribute + ':',
                                style: const TextStyle(fontSize: 20)),
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
                                fontSize: 20, fontWeight: FontWeight.bold)),
                      ])),
                  Expanded(
                      flex: 1,
                      child: Wrap(
                        children: [
                          Text("${widget.card.def}",
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold)),
                        ],
                      )),
                  if (widget.card.attribute != null)
                    Expanded(
                        flex: 1,
                        child: Wrap(
                          children: [
                            Text("${widget.card.attribute}",
                                style: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold)),
                          ],
                        )),
                ]),
              ),
            const SizedBox(height: 20),
            Text(
              LocaleProvider.of(context).description + ':',
              style: const TextStyle(
                fontSize: 20,
              ),
              textAlign: TextAlign.center,
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(8, 8, 0, 0),
              child: Wrap(children: [
                Text(
                  "${widget.card.desc}",
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                )
              ]),
            ),
          ],
        ),
        PriceDetail(price: widget.card.card_prices[0]),
      ];
    } else {
      return <Widget>[
        ListView(
          children: [
            Container(
              padding: const EdgeInsets.all(8.0),
              child: Row(children: [
                if (widget.card.level > 0)
                  const Text("Level:", style: const TextStyle(fontSize: 20)),
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
                          style: TextStyle(fontSize: 20)),
                    ])),
                Expanded(
                    flex: 2,
                    child: Wrap(
                      children: [
                        Text(LocaleProvider.of(context).type + ':',
                            style: const TextStyle(fontSize: 20)),
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
                              fontSize: 20, fontWeight: FontWeight.bold)),
                    ])),
                Expanded(
                    flex: 2,
                    child: Wrap(
                      children: [
                        Text("${widget.card.race}",
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
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
                            style: const TextStyle(fontSize: 20)),
                      ])),
                  Expanded(
                      flex: 1,
                      child: Wrap(
                        children: [
                          Text(LocaleProvider.of(context).defense + ':',
                              style: const TextStyle(fontSize: 20)),
                        ],
                      )),
                  if (widget.card.attribute != null)
                    Expanded(
                        flex: 1,
                        child: Wrap(
                          children: [
                            Text(LocaleProvider.of(context).attribute + ':',
                                style: const TextStyle(fontSize: 20)),
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
                                fontSize: 20, fontWeight: FontWeight.bold)),
                      ])),
                  Expanded(
                      flex: 1,
                      child: Wrap(
                        children: [
                          Text("${widget.card.def}",
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold)),
                        ],
                      )),
                  if (widget.card.attribute != null)
                    Expanded(
                        flex: 1,
                        child: Wrap(
                          children: [
                            Text("${widget.card.attribute}",
                                style: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold)),
                          ],
                        )),
                ]),
              ),
            const SizedBox(height: 20),
            Text(
              LocaleProvider.of(context).description,
              style: const TextStyle(
                fontSize: 20,
              ),
              textAlign: TextAlign.center,
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(8, 8, 0, 0),
              child: Wrap(children: [
                Text(
                  "${widget.card.desc}",
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                )
              ]),
            ),
          ],
        ),
        PriceDetail(price: widget.card.card_prices[0]),
        Card(
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: DefaultTextStyle(
              style: const TextStyle(
                fontSize: 24,
                fontFamily: 'Bobbers',
              ),
              child: AnimatedTextKit(
                animatedTexts: [TyperAnimatedText('${widget.card.name}')],
                repeatForever: true,
              )),
          actions: [
            if (getAnimation(widget.card.name, context) != null)
              IconButton(
                icon: const Icon(Icons.man_rounded),
                onPressed: () {
                  openDialog();
                },
              )
          ],
        ),
        body: Card(
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
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return DetailScreen(images[img]);
                  }));
                },
                loop: true),
          ),
          const SizedBox(height: 20),
          Expanded(
              child: Column(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
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
                    selectedTextStyle: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    unselectedTextStyle: const TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ],
          ))
        ]))),
        floatingActionButton: Visibility(
          visible: Provider.of<UserManager>(context, listen: false).isLoggedIn,
          child: FloatingActionButton(
            onPressed: () {
              openDialogShoop();
            },
            elevation: 10.0,
            child: const Icon(Icons.shopping_cart_outlined),
            backgroundColor: const Color.fromARGB(255, 4, 149, 233),
          ),
        ));
  }
}
