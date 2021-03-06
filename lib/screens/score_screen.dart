import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ScoreScreen extends StatefulWidget {
  ScoreScreen({this.correctAnswers, this.totalQuestions});

  int correctAnswers;
  int totalQuestions;

  @override
  _ScoreScreenState createState() => _ScoreScreenState();
}

class _ScoreScreenState extends State<ScoreScreen> with TickerProviderStateMixin {
  Animation<double> animation;
  Animation<double> rotationAnimation;
  AnimationController rotationController;
  AnimationController controller;
  int offset = 0;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.black87,
        centerTitle: true,
        title: Text("Score"),
      ),
      body: Center(
        child: Transform.translate(
          offset: Offset(0,-animation.value),
          child: Column(
            children: <Widget>[
              Text("You scored ${widget.correctAnswers} question correct out of ${widget.totalQuestions}",textAlign : TextAlign.center,style: GoogleFonts.leckerliOne(
                textStyle: TextStyle(
                fontSize: 50.0,
              ),),),
              Expanded(
                  flex  :1,
                  child: Transform.rotate(
                      angle : rotationController.value*6.3,
                      child: Image.asset("assets/baloon.png",)))
            ],
          )
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: Duration(milliseconds: 3000),
      vsync: this
    );
    animation = Tween<double>(begin: 0.0,end: 10.0).animate(controller);
    controller.addListener((){
      setState(() {
      });
    });
    rotationController = AnimationController(
      duration: Duration(seconds: 7),
      vsync: this
    );
    rotationController.repeat();
    controller.forward();
  }
}
