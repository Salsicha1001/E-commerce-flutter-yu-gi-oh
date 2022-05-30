import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/Commons/Custom_Drawer/custom_drawer.dart';
import 'package:flutter_ecommerce/Components/load_custom.dart';
import 'package:flutter_ecommerce/Screens/Orders/Orders.card.dart';
import 'package:flutter_ecommerce/model/order_response.dart';
import 'package:flutter_ecommerce/services/payament_service.dart';

class OrdesScreen extends StatefulWidget {
  bool isAdmin = false;
  OrdesScreen({this.isAdmin});
  @override
  State<OrdesScreen> createState() => _OrdesScreenState();
}

class _OrdesScreenState extends State<OrdesScreen> {
  List<OrderResponse> listCard = [];
  @override
  void didChangeDependencies() {
    getOrder();
    super.didChangeDependencies();
  }

  getOrder() async {
    LoadCustom().openLoadMsg("Buscando...");
    List<OrderResponse> list;
    if (!widget.isAdmin) {
      list = await OrderPayament().getOrderByUser(context);
    } else {
      list = await OrderPayament().getOrders(context);
    }
    setState(() {
      listCard.addAll(list);
    });
    LoadCustom().closeLoad();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: CustomDrawer(),
        appBar: AppBar(
          title: const Text('Meus Pedidos'),
          centerTitle: true,
        ),
        body: Card(
            margin: const EdgeInsets.all(8.0),
            child: ListView(children: <Widget>[
              if (listCard.isNotEmpty)
                Column(
                  children: listCard
                      .map((order) => OrdersCard(
                            order: order,
                            isAdmin:widget.isAdmin,
                            totalqty:
                                order.cardOrders.fold(0, (value, element) {
                              return value + element.qty;
                            }),
                          ))
                      .toList(),
                ),
            ])));
  }
}
