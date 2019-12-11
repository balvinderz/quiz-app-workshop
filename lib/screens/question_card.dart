import 'package:flutter/material.dart';
import 'package:quizapp/models/question.dart';
import 'package:quizapp/screens/quiz_screen.dart';
import 'package:quizapp/widgets/answer_card.dart';
class QuestionCard extends StatefulWidget
{
Question question;
int index;
int totalQuestions;
Function function;
QuestionCard({this.question,this.index,this.totalQuestions,this.function});

  @override
  _QuestionCardState createState() => _QuestionCardState();
}

class _QuestionCardState extends State<QuestionCard>  with AutomaticKeepAliveClientMixin<QuestionCard> {
  String selected = "";
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
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
                Text("Question ${widget.index}/${widget.totalQuestions}", style: TextStyle(
                    color: Color(0xFFFCFBFC),
                    fontWeight: FontWeight.bold,
                    fontSize: 15.0
                ),),
                SizedBox(
                  height: 20.0,
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(widget.question.question,
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
                  answer: widget.question.option1,
                  selected: widget.question.option1 == selected ? true :false,
                  onTap: (){
                    setState(() {
                      if(selected!=widget.question.option1)
                      selected =widget.question.option1;
                      else
                        selected="";
                      widget.function(selected);

                    });
                  },
                ),
                AnswerCard(
                  answer: widget.question.option2,
                  selected: widget.question.option2 == selected ? true :false,
                  onTap: (){
                    setState(() {
                      if(selected !=widget.question.option2)
                      selected =widget.question.option2;
                      else
                        selected = "";
                      widget.function(selected);


                    });
                  },
                ),
                AnswerCard(
                  answer: widget.question.option3,
                  selected: widget.question.option3 == selected ? true :false,
                  onTap: (){
                    setState(() {
                      if(selected !=widget.question.option3)

                        selected =widget.question.option3;
                      else
                        selected="";
                      widget.function(selected);
                    });
                  },
                ),
                AnswerCard(
                  answer: widget.question.option4,
                  selected: widget.question.option4 == selected ? true :false,
                  onTap: (){
                    setState(() {
                      if(selected !=widget.question.option4)

                        selected =widget.question.option4;
                      else
                        selected="";
                      widget.function(selected);

                    });
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;


}
