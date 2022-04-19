import 'dart:async';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class AnimationCard extends StatefulWidget {
  String video;
  AnimationCard({this.video});
  @override
  _AnimationCardState createState() => _AnimationCardState();
}

class _AnimationCardState extends State<AnimationCard> {
  VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(widget.video)
      ..initialize().then(
        (_) {
          setState(() {
            _controller.play();
            Timer(Duration(seconds: _controller.value.duration.inSeconds), () {
              Navigator.of(context).pop();
            });
          });
        },
      );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
            child: Container(
                child: _controller.value.isInitialized
                    ? VideoPlayer(_controller)
                    : Container(color: Colors.black,))),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
