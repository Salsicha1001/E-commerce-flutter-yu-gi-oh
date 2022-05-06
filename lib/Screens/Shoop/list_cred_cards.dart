import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/Commons/Custom_Drawer/cred_item.dart';
import 'package:flutter_ecommerce/Components/load_custom.dart';
import 'package:flutter_ecommerce/Screens/Shoop/cred_card.dart';
import 'package:flutter_ecommerce/model/payament/cred-card.model.dart';
import 'package:flutter_ecommerce/services/payament_service.dart';

class ListCredCards extends StatefulWidget {
  List<CredCart> listCreds;
  ListCredCards(this.listCreds);
  @override
  State<ListCredCards> createState() => _ListCredCardsState();
}

class _ListCredCardsState extends State<ListCredCards> {
  @override
  void initState() {
    print(widget.listCreds.first.number_card);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Forma de Pagamento")),
        body: Container(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: [
              Card(
                child: ListView(shrinkWrap: true, children: [
                  Column(
                    children: widget.listCreds
                        .map((listCreds) => CredItem(item: listCreds))
                        .toList(),
                  ),
                ]),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            String open = await Navigator.of(context)
                .push(MaterialPageRoute(
                    builder: (BuildContext context) {
                      return CredCardScreen();
                    },
                    fullscreenDialog: true))
                // ignore: missing_return
                .then((value) async {
              LoadCustom().openLoadMsg("Salvando..");
              List<CredCart> list = await OrderPayament().getCredCards(context);
              LoadCustom().closeLoad();
              widget.listCreds = list;
            });
          },
          elevation: 10.0,
          child: const Icon(Icons.add_card),
        ));
  }
}
