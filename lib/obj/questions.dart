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

