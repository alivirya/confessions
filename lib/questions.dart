import 'package:flutter/material.dart';

class Questions {
  List<String> questions;
  Questions(List<String> questions) {
    this.questions = questions;
  }

  set add(String question) {
    this.questions.add(question);
  }

  List<String> get allQuestions {
    return this.questions;
  }

  num get length {
    return this.questions.length;
  }

  String retrieveQuestion(num index) {
    return this.questions[index];
  }
}

class QuestionsPageState extends State<QuestionsPage> {
  Questions questions;
    TextEditingController _textFieldController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Questions'),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.add), onPressed: () => _addQuestion(context)),
        ],
      ),
      body: _buildQuestions(),
    );
  }

  _addQuestion(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: TextField(
            controller: _textFieldController,
            decoration: InputDecoration(hintText: "Question to add"),
          ),
          actions: <Widget>[
            new FlatButton(
              child: new Text("Cancel"),
              onPressed: () {
                Navigator.of(context).pop();
              }
            ),
            new FlatButton(
              child: new Text("Add"),
              onPressed: () {
                questions.add  = _textFieldController.text;
                Navigator.of(context).pop();
              },
            )
          ],
        );
      }
    );
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

  Widget _buildQuestions() {
    _setupQuestions();
    return ListView.builder(
      padding: EdgeInsets.all(16.0),
      itemCount: questions.length,
      itemBuilder: (context, i) {
        if (i.isOdd) return Divider();
        final index = i ~/ 2;

        return _buildRow(index);
      },
    );
  }

  Widget _buildRow(num index) {
    String question = questions.retrieveQuestion(index);
    return ListTile(
      title: Text(
        question
      )
    );
  }
}

class QuestionsPage extends StatefulWidget {
  @override 
  QuestionsPageState createState() => QuestionsPageState();
}

