import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Confessions'),
        ),
        body: Center(
          child: ConfessionsInformation(),
        ),
      ),
    );
  }
}

class ConfessionsInformation extends StatelessWidget {
  ConfessionsInformation({this.question});
  final String question;

  Widget build(BuildContext context) {
    return Container(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text(
          '$question',
          style: TextStyle(
            color: Colors.black,
            fontSize: 30,
          ),
        ),
      ],
    ));
  }
}
