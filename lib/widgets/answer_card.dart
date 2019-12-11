import 'package:flutter/material.dart';
class AnswerCard extends StatelessWidget {
  String answer;
  bool selected;
  Function onTap;
  AnswerCard({this.answer,this.selected=false,this.onTap});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 8.0),
          width: width - 0.2 * width,
          height: 65,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              color: selected? Colors.green.shade400 : Color(0xFF3C0E70)),
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
