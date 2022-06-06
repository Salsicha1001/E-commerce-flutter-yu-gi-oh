import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/Screens/Orders/Orders.detail.dart';
import 'package:flutter_ecommerce/model/order_response.dart';
import 'package:intl/intl.dart';

class OrdersCard extends StatefulWidget {
  final OrderResponse order;
  int totalqty;
  bool isAdmin;
  OrdersCard({this.order, this.isAdmin, this.totalqty});
  @override
  State<OrdersCard> createState() => _OrdersCardState();
}

class _OrdersCardState extends State<OrdersCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        await Navigator.of(context)
            .push(MaterialPageRoute<void>(
                builder: (BuildContext context) {
                  return OrdesDetails(
                    card: widget.order.cardOrders,
                  );
                },
                fullscreenDialog: true))
            .then((value) {});
      },
      child: GestureDetector(
        child: Card(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        if (widget.isAdmin)
                          Text(
                            widget.order.name,
                            style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 18.0,
                            ),
                          ),
                        Text(DateFormat("d 'de' MMMM 'de' y", "pt_BR").format(
                                DateFormat('dd/MM/yyyy')
                                    .parse(widget.order.dateShopp)) +
                            "                                   " +
                            widget.order.hourShopp),
                        Text(
                          widget.order.codOrders,
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 18.0,
                          ),
                        ),
                        Text(
                          'Total de Cartas ${widget.totalqty}',
                          style: TextStyle(
                              fontSize: 16.0, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Total R\$ ${double.parse(widget.order.totalValue).toStringAsFixed(2).replaceAll('.', ',')}',
                          style: TextStyle(
                              fontSize: 16.0, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
