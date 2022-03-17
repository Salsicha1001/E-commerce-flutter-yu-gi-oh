import 'package:flutter/material.dart';

class CardContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image(
          image: NetworkImage(
              "https://storage.googleapis.com/ygoprodeck.com/pics_small/46986414.jpg"),
          ),
    );
  }
}
