import "dart:math";

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

  String retrieveRandomQuestion() {
    final _random = new Random();
    return this.questions[_random.nextInt(this.questions.length)];
  }
}

