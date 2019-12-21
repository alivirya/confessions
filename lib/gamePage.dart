import 'package:confessions/obj/questions.dart';
import 'package:flutter/material.dart';

class GamePageState extends State<GamePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(
      child: Text(widget.questions.retrieveRandomQuestion()),
    )
    );
  }
}

class GamePage extends StatefulWidget {
  final Questions questions;

  GamePage({Key key, @required this.questions}): super(key: key);
  GamePageState createState() => GamePageState();
}