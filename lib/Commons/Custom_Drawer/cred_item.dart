import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/model/payament/cred-card.model.dart';

class CredItem extends StatefulWidget {
  CredCart item;
  final VoidCallback onPressed;
  CredItem({this.item, this.onPressed});

  @override
  State<CredItem> createState() => _CredItemState();
}

class _CredItemState extends State<CredItem> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.amber,
      onTap: () async {
        widget.onPressed();
      },
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        child: Row(children: [
          SizedBox(
            height: 150,
            width: 100,
            child: Image.asset("images/cred.png"),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    widget.item.number_card,
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16.0,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        widget.item.name_card,
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 12.0,
                        ),
                      ),
                      const SizedBox(width: 20),
                      Text(
                        widget.item.expired,
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 12.0,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
