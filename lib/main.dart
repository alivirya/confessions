import 'package:confessions/questionsPage.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Confessions',
      theme: ThemeData(
        primaryColor: Colors.black,
      ),
      home: HomePage(),
    );
  }
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Confession'),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.list), onPressed: _listQuestions)
        ],
      ),
      body: Center(
        child: new SizedBox(
          width: 100.0,
          height: 50.0,
          child: new RaisedButton(
            onPressed: _listQuestions,
            textColor: Colors.white,
            color: Colors.blue,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget> [
                new Text('Start'),
                Icon(Icons.arrow_right)
              ]
            )
          ),
        ),
      ),
    );
  }

  void _listQuestions() {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (BuildContext context) => QuestionsPage()),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}