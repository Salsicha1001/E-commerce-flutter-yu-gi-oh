import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/Commons/Custom_Drawer/cred_item.dart';
import 'package:flutter_ecommerce/Commons/Custom_Drawer/empty_cart.dart';
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
  List<CredCart> list = [];
  @override
  void initState() {
    addItemList(widget.listCreds);
    super.initState();
  }

  addItemList(item) {
    setState(() {
      list.clear();
      list.addAll(item);
    });
  }

  confirm(item) {
    Navigator.of(context).pushNamed('/review', arguments: item);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Forma de Pagamento")),
        body: Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              image: const DecorationImage(
            image: ExactAssetImage('images/card_bg.png'),
            fit: BoxFit.fill,
          )),
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            shrinkWrap: true,
            physics: ClampingScrollPhysics(),
            children: [
              if (list.isNotEmpty)
                Container(
                  child: new ListView.builder(
                      itemCount: list.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        final item = list[index];
                        return Dismissible(
                            confirmDismiss: (DismissDirection direction) async {
                              return await CoolAlert.show(
                                  context: context,
                                  title: 'Deseja Remover Mesmo?',
                                  type: CoolAlertType.confirm,
                                  confirmBtnText: "Sim",
                                  onConfirmBtnTap: () async {
                                    await OrderPayament()
                                        .removeCredCard(context, item.id_card);
                                    list.removeAt(index);
                                    Navigator.of(context).pop(true);
                                  },
                                  cancelBtnText: 'Não',
                                  onCancelBtnTap: () {
                                    Navigator.of(context).pop(false);
                                  });
                            },
                            direction: DismissDirection.endToStart,
                            key: Key(item.id_card.toString()),
                            onDismissed: (direction) {
                              setState(() {});
                            },
                            background: Container(
                              color: Colors.red,
                              alignment: AlignmentDirectional.centerEnd,
                              child: const Padding(
                                padding:
                                    EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 0.0),
                                child: Icon(
                                  Icons.delete,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            child: new CredItem(
                              item: item,
                              onPressed: () {
                                confirm(item);
                              },
                            ));
                      }),
                ),
              if (list.isEmpty)
                Center(
                  child: EmptyCard(
                    iconData: Icons.card_travel_outlined,
                    title: 'Nenhum Cartão Cadastrado!',
                  ),
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
              List<CredCart> lisst =
                  await OrderPayament().getCredCards(context);
              if (lisst.isNotEmpty) {
                addItemList(lisst);
              }
            });
          },
          elevation: 10.0,
          backgroundColor: Colors.indigo,
          child: const Icon(Icons.add_card),
        ));
  }
}
