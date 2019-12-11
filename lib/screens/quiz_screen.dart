import 'package:flutter/material.dart';
import 'package:quizapp/models/question.dart';
import 'package:quizapp/network/quiz_api.dart';
import 'package:quizapp/screens/question_card.dart';
import 'package:quizapp/screens/score_screen.dart';


class QuizScreen extends StatefulWidget {
  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {

  PageController _pageController;
  bool loadingQuestions = true;
  QuizApi quizApi ;
  List<String> selectedAnswers ;
  List<Question> questions;
  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    quizApi = QuizApi();
      quizApi.getQuestions()..then((result) {
        questions = result;
        setState(() {
          loadingQuestions = false;
          selectedAnswers = List(questions.length);
          for(var i =0;i<questions.length;i++)
            selectedAnswers[i]="";
        });
      }
            );


  }
  int getAttemptedQuestions()
  {
    int attemptedQuestions = 0;
    for(String answer in selectedAnswers)
      if(answer!="")
        attemptedQuestions++;
      return attemptedQuestions;
  }

  @override
  void dispose()
  {
    super.dispose();
    _pageController.dispose();
  }
  Future<void> submitQuiz() async
  {
    return showDialog(context: context,
    builder: (context){
      return AlertDialog(
        title: Text("Do you want to submit the quiz"),

        actions: <Widget>[
          FlatButton(
            child: Text("No"),
            onPressed: (){
              Navigator.pop(context);
            },
          ),
          FlatButton(
            child: Text("Yes"),
            onPressed: ()async {
              int correctAnswers = 0;
              for(var i =0;i<questions.length;i++)
                if(questions[i].answer == selectedAnswers[i])
                  correctAnswers++;
                print(correctAnswers);
               await  Navigator.push(context, MaterialPageRoute(
                  builder: (context)=> ScoreScreen(correctAnswers: correctAnswers,totalQuestions: questions.length,)
                )
                );
                Navigator.pop(context);
            },
          )
        ],
      );
    }
    );
  }
  int attemptedQuestions =0;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        elevation: 0.0,
        title: Text("Quiz"),
        centerTitle: true,
        actions: loadingQuestions ? null : <Widget>[

          Center(child: Text("${getAttemptedQuestions()
          }/${questions.length}")),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              icon: Icon(Icons.check),
              onPressed: submitQuiz
            )
          ),
        ],
      ),
      body: loadingQuestions ? Center(
        child: CircularProgressIndicator(),
      ) : PageView.builder(
        physics: BouncingScrollPhysics(),
        controller: _pageController,
        itemCount: questions.length,
        itemBuilder: (context, index) => QuestionCard(question : questions[index],totalQuestions: questions.length,index: index+1, function : (selected){
          setState(() {
            selectedAnswers[index] =selected;
          });
        } ),
      ),
    );
  }
}

