import 'package:flutter/material.dart';

class Questions {
  List<String> questions;
  Questions() {
    this.questions = [];
  }

  set question(String question) {
    this.questions.add(question);
  }

  set bulkAdd(List<String> questions) {
    this.questions.addAll(questions);
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Questions')
      ),
      body: _buildQuestions(),
    );
  }

  setupQuestions() {
    List<String> initialQuestions = [
      "How would you rank the following in importance: family, career, love life?",
      "Do you think god is real, and why?",
      "Do you believe in giving people second chances, and why?",
      "What do you look for in a relationship?",
      "What is your idea of a perfect date?"];
    questions = Questions();
    questions.bulkAdd = initialQuestions;
  }

  Widget _buildQuestions() {
    setupQuestions();
    return ListView.builder(
      padding: EdgeInsets.all(16.0),
      itemBuilder: (context, i) {
        if (i.isOdd) return Divider();
        final index = i ~/ 2;
        if (index < questions.length) {
          return _buildRow(questions.retrieveQuestion(index));
        }
      },
    );
  }

  Widget _buildRow(String question) {
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

