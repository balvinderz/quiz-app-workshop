class Question {
  String question, option1, option2, option3, option4, answer;

  Question({this.question, this.option1, this.option2, this.option3,
    this.option4, this.answer});

  Question.fromJson(dynamic json)
      :
        question = json['question'],
        option1 = json['option1'],
        option2 = json['option2'],
        option3 = json['option3'],
        option4 = json['option4'],
        answer = json['answer'];



}