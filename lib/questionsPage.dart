import 'package:flutter/material.dart';

import 'obj/questions.dart';

class QuestionsPageState extends State<QuestionsPage> {
  //Will probably have to move this to the main class? 
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
    return await showDialog(
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
                widget.questions.add  = _textFieldController.text;
                Navigator.of(context).pop();
              },
            )
          ],
        );
      }
    );
  }

  Widget _buildQuestions() {
    return ListView.builder(
      padding: EdgeInsets.all(16.0),
      itemCount: widget.questions.length * 2,
      itemBuilder: (context, i) {
        if (i.isOdd) return Divider();
        final index = i ~/ 2;

        return _buildRow(index);
      },
    );
  }

  Widget _buildRow(num index) {
    String question = widget.questions.retrieveQuestion(index);
    return ListTile(
      title: Text(
        question
      )
    );
  }
}

class QuestionsPage extends StatefulWidget {
  final Questions questions;

  QuestionsPage({Key key, @required this.questions}): super(key: key);

  @override 
  QuestionsPageState createState() => QuestionsPageState();
}
