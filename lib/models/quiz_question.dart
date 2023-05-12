class QuizQuestion {
  String text;
  List<String> answer;
  QuizQuestion(this.text, this.answer);

  List<String> getShuffeltQuestion() {
    var list = answer;
    list.shuffle();
    return list;
  }
}
