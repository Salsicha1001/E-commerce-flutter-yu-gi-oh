import 'package:chips_choice/chips_choice.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/generated/l10n.dart';
import 'package:flutter_ecommerce/model/card/filter_request_card.dart';
import 'package:tab_container/tab_container.dart';

class FilterCard extends StatefulWidget {
  final FilterCardRequest initialWeight;

  FilterCard.add(this.initialWeight);
  @override
  _FilterCardState createState() {
    if (initialWeight != null) {
      return _FilterCardState(this.initialWeight);
    } else {
      return _FilterCardState(null);
    }
  }
}

class _FilterCardState extends State<FilterCard> {
  TabContainerController _controller;
  List<String> tagsType = [];
  List<String> tagsAttribute = [];
  List<String> tagsRaceMagic = [];
  List<String> tagsRaceTrap = [];

  List<String> tagsRace = [];

  FilterCardRequest request;
  _FilterCardState(this.request);
  List<Map<String, String>> TypeCardsMonster = [
    {'value': 'Effect Monster', 'title': 'Efeito'},
    {'value': 'Normal Monster', 'title': 'Normal'},
    {'value': 'Ritual Monster', 'title': 'Ritual'},
    {'value': 'Fusion Monster', 'title': 'Fusão'},
    {'value': 'Link Monster', 'title': 'Link'},
    {'value': 'Pendulum Normal Monster', 'title': 'Pêndulo'},
    {'value': 'XYZ Monster', 'title': 'XYZ'},
    {'value': 'Synchro Monster', 'title': 'Sincro'},
    {'value': 'Skill Card', 'title': 'Carta Habilidade'},
  ];
  List<Map<String, String>> RaceCard = [
    {'value': 'Aqua', 'title': 'Água'},
    {'value': 'Beast', 'title': 'Fera'},
    {'value': 'Beast-Warrior', 'title': 'Besta-Guerreira'},
    {'value': 'Creator-God', 'title': 'Deus-Criador'},
    {'value': 'Cyberse', 'title': 'Cyberso'},
    {'value': 'Dinosaur', 'title': 'Dinossauro'},
    {'value': 'Fairy', 'title': 'Fada'},
    {'value': 'Divine-Beast', 'title': 'Besta Divina'},
    {'value': 'Dragon', 'title': 'Dragão'},
    {'value': 'Fiend"', 'title': 'Demônio'},
    {'value': 'Fish', 'title': 'Peixe'},
    {'value': 'Insect', 'title': 'Inseto'},
    {'value': 'Machine', 'title': 'Máquina'},
    {'value': 'Plant', 'title': 'Planta'},
    {'value': 'Psychic', 'title': 'Psíquico'},
    {'value': 'Pyro', 'title': 'Pyro'},
    {'value': 'Reptile', 'title': 'Réptil'},
    {'value': 'Rock', 'title': 'Rocha'},
    {'value': 'Sea Serpent', 'title': 'Serpente do mar'},
    {'value': 'Spellcaster', 'title': 'Feiticeiro'},
    {'value': 'Thunder', 'title': 'Trovão'},
    {'value': 'Warrior', 'title': 'Guerreiro'},
    {'value': 'Winged Beast', 'title': 'Besta Alada'},
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

  List<Map<String, String>> raceMagic = [
    {'value': 'Normal', 'title': 'Magia Normal'},
    {'value': 'Field', 'title': 'Magia Campo'},
    {'value': 'Equip', 'title': 'Magia Equipamento'},
    {'value': 'Continuous', 'title': 'Magia Contínuo'},
    {'value': 'Quick-Play', 'title': 'Magia Rápida'},
    {'value': 'Ritual', 'title': 'Magia Ritual'},
  ];
  List<Map<String, String>> raceTrap = [
    {'value': 'Normal', 'title': 'Armadilha Normal'},
    {'value': 'Counter', 'title': 'Armadilha de Resposta'},
    {'value': 'Continuous', 'title': 'Armadilha Contínuo'},
  ];

  @override
  void initState() {
    _controller = TabContainerController(length: 2);
    if (request != null) {
      if (request.type != '') tagsType.addAll(request.type.split(','));
      if (request.attribute != '')
        tagsAttribute.addAll(request.attribute.split(','));
      if (request.race != '') {
        if (request.type == 'Spell Card') {
          tagsRaceMagic.addAll(request.race.split(','));
        } else if (request.type == 'Trap Card') {
          tagsRaceTrap.addAll(request.race.split(','));
        } else {
          tagsRace.addAll(request.race.split(','));
        }
      }
    }
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
          child: ListView(
            padding: const EdgeInsets.all(20.0),
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 5,
                    child: Text(
                      LocaleProvider.of(context).type_card,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
                    tagsRaceMagic.clear();
                    tagsRaceTrap.clear();
                  })),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    flex: 5,
                    child: Text(
                      LocaleProvider.of(context).attribute,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
                  choiceActiveStyle: const C2ChoiceStyle(
                      color: Color.fromARGB(255, 0, 60, 255)),
                  onChanged: (vau) => setState((() {
                    tagsAttribute = vau;
                    tagsRaceMagic.clear();
                    tagsRaceTrap.clear();
                  })),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    flex: 5,
                    child: Text(
                      LocaleProvider.of(context).type,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  )
                ],
              ),
              Container(
                child: ChipsChoice<String>.multiple(
                  choiceItems: C2Choice.listFrom<String, Map<String, dynamic>>(
                    source: RaceCard,
                    value: (index, item) => item['value'],
                    label: (index, item) => item['title'],
                  ),
                  value: tagsRace,
                  wrapped: true,
                  choiceActiveStyle: const C2ChoiceStyle(
                      color: Color.fromARGB(255, 0, 60, 255)),
                  onChanged: (vau) => setState((() {
                    tagsRace = vau;
                    tagsRaceMagic.clear();
                    tagsRaceTrap.clear();
                  })),
                ),
              ),
            ],
          )),
      Container(
        padding: const EdgeInsets.all(10.0),
        child: Column(children: [
          Row(
            children: [
              Expanded(
                flex: 5,
                child: Text(
                  LocaleProvider.of(context).card_magic,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              )
            ],
          ),
          Container(
            child: ChipsChoice<String>.multiple(
              choiceItems: C2Choice.listFrom<String, Map<String, dynamic>>(
                source: raceMagic,
                value: (index, item) => item['value'],
                label: (index, item) => item['title'],
              ),
              value: tagsRaceMagic,
              wrapped: true,
              choiceActiveStyle:
                  C2ChoiceStyle(color: Color.fromARGB(255, 0, 60, 255)),
              onChanged: (vau) => setState((() {
                if (tagsRaceTrap.isNotEmpty) {
                  tagsRaceTrap.clear();
                }
                tagsAttribute.clear();
                tagsRace.clear();
                tagsType.clear();
                tagsRaceMagic = vau;
              })),
            ),
          ),
          Row(
            children: [
              Expanded(
                flex: 5,
                child: Text(
                  LocaleProvider.of(context).card_trap,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              )
            ],
          ),
          Container(
            child: ChipsChoice<String>.multiple(
              choiceItems: C2Choice.listFrom<String, Map<String, dynamic>>(
                source: raceTrap,
                value: (index, item) => item['value'],
                label: (index, item) => item['title'],
              ),
              value: tagsRaceTrap,
              wrapped: true,
              choiceActiveStyle:
                  C2ChoiceStyle(color: Color.fromARGB(255, 0, 60, 255)),
              onChanged: (vau) => setState((() {
                if (tagsRaceMagic.isNotEmpty) {
                  tagsRaceMagic.clear();
                }
                tagsAttribute.clear();
                tagsRace.clear();
                tagsType.clear();
                tagsRaceTrap = vau;
              })),
            ),
          ),
        ]),
      )
    ];
  }

  List<String> _getTabs2() {
    return <String>[
      LocaleProvider.of(context).monster,
      LocaleProvider.of(context).card_magic +
          LocaleProvider.of(context).and +
          LocaleProvider.of(context).card_trap
    ];
  }

  List<Color> _getColors() {
    return [
      Color.fromARGB(255, 147, 194, 241),
      Color.fromARGB(255, 147, 194, 241),
    ];
  }

  _getSearchRequest() {
    String type = '';
    String race = '';
    String attribute = '';
    String raceMagic = '';
    String raceTrap = '';
    if (tagsRaceMagic.isNotEmpty || tagsRaceTrap.isNotEmpty) {
      if (tagsRaceMagic.isNotEmpty) {
        type = 'Spell Card';
        race = this.tagsRaceMagic.join(',');
      } else {
        type = 'Trap Card';
        race = this.tagsRaceTrap.join(',');
      }
    } else {
      type = this.tagsType.join(',');
      race = this.tagsRace.join(',');
      attribute = this.tagsAttribute.join(',');
    }
    Navigator.of(context).pop(FilterCardRequest(
        type: type,
        attribute: attribute,
        race: race,
        fname: request.fname != '' ? request.fname : ''));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:const Color.fromARGB(255, 3, 107, 244),
      appBar: AppBar(actions: [
        TextButton(
            onPressed: () {
              _getSearchRequest();
            },
            child: Text(
              LocaleProvider.of(context).search,
              style: const TextStyle(color: Colors.white),
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
                controller: _controller,
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
                selectedTextStyle: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                unselectedTextStyle:const TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
          ),
        ]),
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _getSearchRequest();
        },
        child: const Icon(Icons.search),
      ),
    );
  }
}
