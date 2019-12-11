import 'package:flutter/material.dart';

class QuizScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final width = MediaQuery
        .of(context)
        .size
        .width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        elevation: 0.0,
        title: Text("Quiz"),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.black87,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            decoration: BoxDecoration(

              color: Color(0xFF8434DE),
              borderRadius: BorderRadius.circular(15.0)
            ),
            child: Center(
              child: Column(

                children: <Widget>[
                  SizedBox(
                    height: 50.0,
                  ),
                  Text("Question 3/10", style: TextStyle(
                      color: Color(0xFFFCFBFC),
                      fontWeight: FontWeight.bold,
                      fontSize: 15.0
                  ),),
                  SizedBox(
                    height: 20.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text("What was the first product launched by Apple?",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        textBaseline: TextBaseline.alphabetic,
                        color: Color(0xFFFCFBFC),
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                      ),),
                  ),
                  SizedBox(
                    height: 50.0,
                  ),
                  AnswerCard(
                    answer: "iPhone",
                    isCorrect: false,
                  ),
                  AnswerCard(
                    answer: "iPad",
                    isCorrect: false,
                  ),
                  AnswerCard(
                    answer: "iPod ",
                    isCorrect: false,
                  ),
                  AnswerCard(
                    answer: "Apple I",
                    isCorrect: true,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class AnswerCard extends StatelessWidget {
  String answer;
  bool isCorrect;

  AnswerCard({this.answer, this.isCorrect});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery
        .of(context)
        .size
        .width;
    return Material(
      color: Colors.transparent,
      child: InkWell(
          onTap: (){
            print("soja");
          },
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 8.0),
            width: width - 0.2 * width,
            height: 65,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0), color: Color(0xFF3C0E70)),
            child: Center(
              child: Text(
                answer,
                style: TextStyle(color: Colors.white, fontSize: 25.0),
              ),
            ),
          ),

      ),
    );
  }
}
