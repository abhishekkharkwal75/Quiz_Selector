import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  final String questionText;

  Question(
      this.questionText); //creating constructor ...........this is not a named argument but a persisnal argument

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity, //container takes the full width of screen now
        margin: EdgeInsets.all(
            15), //press control and hover over the EdgeInsets you will get link
        child: Padding(
          padding: const EdgeInsets.only(bottom: 50.0),
          child: Text(
            questionText,
            style: TextStyle(fontSize: 28),
            textAlign: TextAlign.center,
          ),
        ));
  }
}
