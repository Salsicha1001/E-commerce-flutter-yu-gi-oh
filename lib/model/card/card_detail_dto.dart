import 'package:flutter_ecommerce/model/card/card_images.dart';
import 'package:flutter_ecommerce/model/card/cards_prices.dart';
import 'package:flutter_ecommerce/model/card/setCardRarity.dart';

class CardDetailDto {
  int id;
  String name;
  String type;
  String desc;
  String race;
  String archetype;
  int atk;
  int def;
  int level;
  String attribute;
  int linkval;
  List<String> linkmarkers;
  int scale;
  List<CardsSet> card_sets;
  List<CardsImage> card_images;
  List<CardsPrices> card_prices;

  CardDetailDto(
      {this.id,
      this.name,
      this.type,
      this.desc,
      this.race,
      this.archetype,
      this.atk,
      this.def,
      this.level,
      this.attribute,
      this.linkval,
      this.linkmarkers,
      this.scale,
      this.card_sets,
      this.card_images,
      this.card_prices});

  Map toJson() => {
        'id': id,
        'name': name,
        'type': type,
        'desc': desc,
        'race': race,
        'archetype': archetype,
        'atk': atk,
        'def': def,
        'level': level,
        'attribute': attribute,
        'linkval': linkval,
        'scale': scale,
        'card_sets': card_sets.map((e) => e.toJson()).toList(),
        'card_images': card_images.map((e) => e.toJson()).toList(),
        'card_prices': card_prices.map((e) => e.toJson()).toList()
      };
  factory CardDetailDto.fromMap(Map<String, dynamic> map) {
    return CardDetailDto(
      id: map['id'],
      name: map['name'],
      type: map['type'],
      desc: map['desc'],
      race: map['race'],
      archetype: map['archetype'],
      atk: map['atk'],
      def: map['def'],
      level: map['level'],
      attribute: map['attribute'],
      linkval: map['linkval'],
      scale: map['scale'],
      card_sets: List<CardsSet>.from(map['card_sets'].map((x)=>CardsSet.fromJson(x))),
      card_images: List<CardsImage>.from(map['card_images'].map((x)=>CardsImage.fromJson(x))),
      card_prices: List<CardsPrices>.from(map['card_prices'].map((x)=>CardsPrices.fromJson(x))),
    );
  }
}
