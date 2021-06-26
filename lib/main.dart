import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/result.dart';
import './result.dart';
import './quiz.dart';

void main() {
  runApp(AviApp());
}

class AviApp extends StatefulWidget {
  //this class can be recreated when the external data changes
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _AviAppState();
  }
}

class _AviAppState extends State<AviApp> {
  //this class will not(persistent) now we need to flutter that this class belongs to upper class
  final _questions = const [
    {
      'questionText': 'what\'s your favourite color?',
      'answer': [
        {'text': 'black', 'score': 1},
        {'text': 'red', 'score': 2},
        {'text': 'blue', 'score': 3},
        {'text': 'green', 'score': 4}
      ]
    },
    {
      'questionText': 'what\'s your favourite Animal?',
      'answer': [
        {'text': 'dog', 'score': 5},
        {'text': 'cat', 'score': 6},
        {'text': 'rabbit', 'score': 7},
        {'text': 'cow', 'score': 1}
      ]
    },
    {
      'questionText': 'which car do you like?',
      'answer': [
        {'text': 'bmw m series', 'score': 1},
        {'text': 'supra', 'score': 3},
        {'text': 'chevrolet', 'score': 10},
        {'text': 'ford truck', 'score': 11}
      ]
    },
    {
      'questionText': 'your favourite place to visit?',
      'answer': [
        {'text': 'mountains', 'score': 1},
        {'text': 'river banks', 'score': 3},
        {'text': 'beach', 'score': 15},
        {'text': 'Planes', 'score': 11}
      ]
    },
  ];

  var _questionIndex = 0;
  var _totalScore = 0;
  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void answerQuestion(int score) {
    _totalScore += score;
    setState(() {
      _questionIndex = _questionIndex + 1;
    });

    print(_questionIndex);
    if (_questionIndex <= _questions.length) {
      print('we have more questions!');
    } else {
      print('no more question');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
            centerTitle: _questionIndex == 0 ? false : true,
            title: Text('Quiz Selector'),
            backgroundColor: Colors.green[200],
            leading: _questionIndex != 0
                ? IconButton(
                    icon: Icon(CupertinoIcons.back),
                    onPressed: () {
                      if (_questionIndex == 0 || _totalScore == 0) {
                        return null;
                      } else {
                        setState(() {
                          _questionIndex = _questionIndex - 1;
                          _totalScore = _totalScore - 1;
                        });
                      }
                    },
                  )
                : null),
        body: _questionIndex < _questions.length
            ? //exception resolution easy way
            Quiz(
                answerQuestion: answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
