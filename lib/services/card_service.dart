import 'dart:convert';
import 'dart:developer';
import 'package:flutter_ecommerce/Components/dialog_custom.dart';
import 'package:flutter_ecommerce/Components/load_custom.dart';
import 'package:flutter_ecommerce/generated/l10n.dart';
import 'package:flutter_ecommerce/helpers/language.dart';
import 'package:flutter_ecommerce/model/card/card_detail_dto.dart';
import 'package:flutter_ecommerce/model/card/cards_list.dart';
import 'package:flutter_ecommerce/model/card/filter_request_card.dart';
import 'package:http/http.dart' as http;

class CardService {

  Future<List<CardList>> getCardPagination(context, page) async {
    LoadCustom().openLoadMsg(LocaleProvider.of(context).search + '....');
    final response = await http.get(
      Uri.parse(url +
          '/getHomeCardsResume?' +
          "language=${getLanguge(context)}&linesPerPage=20&page=${page}"),
      headers: <String, String>{
        "Content-Type": "application/json;charset=UTF-8",
      },
    );

    var msg = json.decode(utf8.decode(response.bodyBytes));
    if (response.statusCode == 200) {
      var listMap = (msg['data'] as List);
      List<CardList> listCard =
          listMap.map<CardList>((json) => CardList.fromJson(json)).toList();
      return listCard;
    } else {
      LoadCustom().closeLoad();
      DialogsCustom().showDialogAlert(
          context, 'Erro  ${response.statusCode}', ' ${msg['msg']}');
    }
  }

  Future<CardDetailDto> getCardByName(context, name) async {
    LoadCustom().openLoadMsg(LocaleProvider.of(context).search + '....');
    final response = await http.get(
      Uri.parse(
          url + '/getByName?' + "name=${name}&language=${getLanguge(context)}"),
      headers: <String, String>{
        "Content-Type": "application/json;charset=UTF-8",
      },
    );
    var msg = json.decode(utf8.decode(response.bodyBytes));
    if (response.statusCode == 200) {
      var listMap = (msg['data'] as List);
      List<CardDetailDto> listCard = listMap
          .map<CardDetailDto>((json) => CardDetailDto.fromMap(json))
          .toList();
      LoadCustom().closeLoad();
      return listCard.first;
    } else {
      LoadCustom().closeLoad();
      DialogsCustom().showDialogAlert(
          context, 'Erro  ${response.statusCode}', ' ${msg['msg']}');
    }
  }

  Future<List<CardList>> getCardByArctype(context, archetype) async {
    final response = await http.get(
      Uri.parse(url +
          '/getByArchetype?' +
          "archetype=${archetype}&language=${getLanguge(context)}"),
      headers: <String, String>{
        "Content-Type": "application/json;charset=UTF-8",
      },
    );
    var msg = json.decode(utf8.decode(response.bodyBytes));
    if (response.statusCode == 200) {
      var listMap = (msg['data'] as List);
      List<CardList> listCard =
          listMap.map<CardList>((json) => CardList.fromJson(json)).toList();
      LoadCustom().closeLoad();
      return listCard;
    } else {
      LoadCustom().closeLoad();
      DialogsCustom().showDialogAlert(
          context, 'Erro  ${response.statusCode}', ' ${msg['msg']}');
    }
  }

  Future<List<CardList>> getCardByFilter(
      context, FilterCardRequest request, page) async {
    LoadCustom().openLoadMsg("Buscando...");
    final response = await http.get(
      Uri.parse(url +
          '/search?' +
          "&language=${getLanguge(context)}" +
          "&type=${request.type}" +
          "&race=${request.race}" +
          "&fname=${request.fname}" +
          "&linesPerPage=20&page=${page}"),
      headers: <String, String>{
        "Content-Type": "application/json;charset=UTF-8",
      },
    );
    var msg = json.decode(utf8.decode(response.bodyBytes));
    if (response.statusCode == 200) {
      var listMap = (msg['data'] as List);
      List<CardList> listCard =
          listMap.map<CardList>((json) => CardList.fromJson(json)).toList();
      LoadCustom().closeLoad();
      return listCard;
    } else {
      LoadCustom().closeLoad();

      return null;
    }
  }

  Future<List<CardList>> getCardRecomend(context) async {
    LoadCustom().openLoadMsg('Buscando as cartas recomendadas...');
    final response = await http.get(
      Uri.parse(url + '/random?language=${getLanguge(context)}'),
      headers: <String, String>{
        "Content-Type": "application/json;charset=UTF-8",
      },
    );
    var msg = json.decode(utf8.decode(response.bodyBytes));
    if (response.statusCode == 200) {
      var listMap = (msg as List);
      List<CardList> listCard =
          listMap.map<CardList>((json) => CardList.fromJson(json)).toList();
      LoadCustom().closeLoad();
      return listCard;
    } else {
      LoadCustom().closeLoad();
      DialogsCustom().showDialogAlert(
          context, 'Erro  ${response.statusCode}', ' ${msg['msg']}');
    }
  }
}
