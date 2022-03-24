import 'dart:developer';

import 'package:chips_choice/chips_choice.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/model/Manager/config_manager.dart';
import 'package:provider/provider.dart';
import 'package:tab_container/tab_container.dart';

class FilterCard extends StatefulWidget {
  final String initialWeight;

  FilterCard.add(this.initialWeight);
  @override
  _FilterCardState createState() {
    if (initialWeight != null) {
      return new _FilterCardState('weighEntryToEdit.dateTime,');
    } else {
      return new _FilterCardState('new DateTime.now(), initialWeight, null');
    }
  }
}

class _FilterCardState extends State<FilterCard> {
  TabContainerController _controller;
  List<String> tagsType = [];
  List<String> tagsAttribute = [];

  String teste;
  _FilterCardState(this.teste);
  List<Map<String, String>> TypeCardsMonster = [
    {'value': 'Effect Monster', 'title': 'Efeito'},
    {'value': 'Normal Monster', 'title': 'Normal'},
    {'value': 'Ritual Monster', 'title': 'Ritual'},
    {'value': 'Fusion Monster', 'title': 'Fusão'},
    {'value': 'Link Monster', 'title': 'Link'},
    {'value': 'Pendulum Normal Monster', 'title': 'Pêndulo'},
    {'value': 'XYZ Monster', 'title': 'XYZ'},
    {'value': 'Synchro Monster', 'title': 'Sincro'},
  ];
  List<Map<String, String>> AtributeCard = [
    {'value': 'DARK', 'title': 'Trevas'},
    {'value': 'EARTH', 'title': 'Terra'},
    {'value': 'FIRE', 'title': 'Fogo'},
    {'value': 'LIGHT', 'title': 'Luz'},
    {'value': 'WATER', 'title': 'Água'},
    {'value': 'WIND', 'title': 'Fada'},
    {'value': 'DIVINE', 'title': 'Divino'},
  ];
  @override
  void initState() {
    _controller = TabContainerController(length: 3);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  List<Widget> _getChildren2() {
    return <Widget>[
      Container(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Row(
                children: const [
                  Expanded(
                    flex: 5,
                    child: Text(
                      "Tipo de Carta",
                      style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  )
                ],
              ),
              Container(
                child: ChipsChoice<String>.multiple(
                  choiceItems: C2Choice.listFrom<String, Map<String, dynamic>>(
                    source: TypeCardsMonster,
                    value: (index, item) => item['value'],
                    label: (index, item) => item['title'],
                  ),
                  value: tagsType,
                  wrapped: true,
                  choiceActiveStyle:
                      C2ChoiceStyle(color: Color.fromARGB(255, 0, 60, 255)),
                  onChanged: (vau) => setState((() {
                    tagsType = vau;
                    print("${tagsType}");
                  })),
                ),
              ),
              Row(
                children: const [
                  Expanded(
                    flex: 5,
                    child: Text(
                      "Atributo",
                      style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  )
                ],
              ),
              Container(
                child: ChipsChoice<String>.multiple(
                  choiceItems: C2Choice.listFrom<String, Map<String, dynamic>>(
                    source: AtributeCard,
                    value: (index, item) => item['value'],
                    label: (index, item) => item['title'],
                  ),
                  value: tagsAttribute,
                  wrapped: true,
                  choiceActiveStyle:
                      const C2ChoiceStyle(color: Color.fromARGB(255, 0, 60, 255)),
                  onChanged: (vau) => setState((() {
                    tagsAttribute = vau;
                    print("${tagsAttribute}");
                  })),
                ),
              )
            ],
          )),
      Image.network(
          "https://storage.googleapis.com/ygoprodeck.com/pics/23771716.jpg"),
      Image.network(
          "https://storage.googleapis.com/ygoprodeck.com/pics/23771716.jpg"),
    ];
  }

  List<String> _getTabs2() {
    return <String>['Monstros', 'Image 2', 'Image 3'];
  }

  List<Color> _getColors() {
    return [
      Color.fromARGB(255, 147, 194, 241),
      Color.fromARGB(255, 147, 194, 241),
      Color.fromARGB(255, 147, 194, 241),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [
        TextButton(
            onPressed: () {
              Navigator.of(context)
                  .pop("new WeightEntry(_dateTime, _weight, _note)");
            },
            child: Text(
              "Buscar",
              style: TextStyle(color: Colors.white),
            ))
      ]),
      body: SingleChildScrollView(
          child: SizedBox(
        child: Column(children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: AspectRatio(
              aspectRatio: 10 / 8,
              child: TabContainer(
                radius: 25,
                tabEdge: TabEdge.top,
                tabCurve: Curves.easeInSine,
                transitionBuilder: (child, animation) {
                  animation =
                      CurvedAnimation(curve: Curves.easeIn, parent: animation);
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
                colors: _getColors(),
                children: _getChildren2(),
                tabs: _getTabs2(),
                selectedTextStyle: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                unselectedTextStyle: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
          ),
        ]),
      )),
    );
  }
}
