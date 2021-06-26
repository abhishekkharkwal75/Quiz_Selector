import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final VoidCallback selectHandler;
  final String answerText; //assigning answerText
  Answer(this.selectHandler,
      this.answerText); //passing it in answerText in constructor
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: double.infinity,
          child: RaisedButton(
            color: Colors.orange[400],
            child: Text(answerText), //calling answerText in text
            onPressed: selectHandler,
          ),
        ),
      ],
    );
  }
}
