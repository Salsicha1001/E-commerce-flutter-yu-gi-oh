import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  String img;
  DetailScreen(this.img);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Center(
          child: Image.network(
            img,
          ),
        ),
      ),
    );
  }
}
