import 'package:flutter/material.dart';
class ScoreScreen extends StatelessWidget
{
  ScoreScreen({this.correctAnswers,this.totalQuestions});
  int correctAnswers;
  int totalQuestions;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        centerTitle: true,
        title: Text("Score"),
      ),
      body: Center(
        child: Text("You scored $correctAnswers out of $totalQuestions"),
      ),
    );
  }
}
