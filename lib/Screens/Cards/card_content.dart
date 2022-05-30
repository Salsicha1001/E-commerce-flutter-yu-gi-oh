import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/model/card/card_detail_dto.dart';
import 'package:flutter_ecommerce/model/card/cards_list.dart';
import 'package:flutter_ecommerce/services/card_service.dart';

class CardContent extends StatelessWidget {
  CardList cardList;
  CardDetailDto dto;
  List<CardList> cards;
  CardContent({this.cardList});

  @override
  Widget build(BuildContext context) {
    return Ink(
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.contain,
          image: NetworkImage(cardList.imageSmall),
        ),
      ),
      child: InkWell(
        onTap: () async {
          dto = await CardService().getCardByName(context, cardList.name);
          if (dto.archetype != null) {
            cards = await CardService()
                .getCardByArctype(context, cardList.archetype);
          }
          if (dto.id != null) {
            Navigator.of(context)
                .pushNamed("/detail-card", arguments: [dto, cards]);
          }
        },
      ),
    );
  }
}
