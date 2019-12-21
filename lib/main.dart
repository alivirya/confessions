import 'package:confessions/gamePage.dart';
import 'package:confessions/questionsPage.dart';
import 'package:flutter/material.dart';
import 'obj/questions.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Confessions',
      theme: ThemeData(
        primaryColor: Colors.purple,
      ),
      home: HomePage(),
    );
  }
}

class HomePageState extends State<HomePage> {
  Questions questions;

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
            onPressed: _startGame,
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

  @override
  void initState() {
    super.initState();
    _setupQuestions();
  }

  _setupQuestions() {
    List<String> initialQuestions = [
      "How would you rank the following in importance: family, career, love life?",
      "Do you think god is real, and why?",
      "Do you believe in giving people second chances, and why?",
      "What do you look for in a relationship?",
      "What is your idea of a perfect date?",
      "What three adjectives describe you?",
      "Have you had your heart broken before?",
      "What makes you nostalgic?"];
    questions = Questions(initialQuestions);
  }

  void _startGame() {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (BuildContext context) => GamePage(questions: this.questions),
      ));
    }

  void _listQuestions() {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (BuildContext context) => QuestionsPage(questions: this.questions)),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}