import 'package:first_app/result.dart';
import 'package:flutter/material.dart';

import './question.dart';
import './answer.dart';

import './quiz.dart';

import './result.dart';

// void main(){
//   runApp(MyApp());
// }

void main() => runApp(MyApp());

//Stateful can re-eun build() when its properties change

class MyApp extends StatefulWidget {
  @override //@override agian bc. createState is a method provided by stateful wigget
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

// _ : special syntax turn public class --> private clss

class _MyAppState extends State<MyApp> {
  //This class belong to the MyApp(Wiget)

  final _questions = const [
    //Add 'const' in front of variable for value is const in Dart
    {
      'questionText': 'What\'s your fav color?', //Map = key-value 'pair'
      'answer': [
        {'text': 'Black', 'score': 10},
        {'text': 'White', 'score': 5},
        {'text': 'Green', 'score': 3},
        {'text': 'Red', 'score': 2},
      ],
    },
    {
      'questionText': 'What\'s your fav animal?',
      'answer': [
        {'text': 'Dog', 'score': 5},
        {'text': 'Cat', 'score': 10},
        {'text': 'Snake', 'score': 1},
        {'text': 'Fish', 'score': 4},
      ],
    },
    {
      'questionText': 'What\'s your fav instructor?',
      'answer': [
        {'text': 'Max', 'score': 10},
        {'text': 'Jane', 'score': 8},
        {'text': 'Mike', 'score': 5}
      ],
    },
    {
      'questionText': 'What\'s your fav place?',
      'answer': [
        {'text': 'Bed', 'score': 10},
        {'text': 'Sea', 'score': 6},
        {'text': 'Office', 'score': 1},
      ]
    }
  ];

  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    //setState is function to provided by the State<MyApp> inherit(ถ่ายทอด)
    //setState is function that forces Flutter to re-render the UI

    _totalScore += score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });

    if (_questionIndex < _questions.length) {
      print('Score = '+ score.toString());
      print('We have more question!' + ' (' + _questionIndex.toString()+ ')');
    } else {
      print('Score = '+ score.toString());
      print('No more question!'+ ' (' + _questionIndex.toString() + ')');
      print('Total Score = '+ _totalScore.toString());
    }    
    //print('Any Answer chosen!');
  }

  //inheritance by 'extends'
  @override //decorator
  Widget build(BuildContext context) {
    //questions = [];   //can't be assigned new object if questions is a 'const' (it could var .... const [])

    // var dummy = const ['Hello'];
    // dummy.add('Max');
    // print(dummy);
    // dummy = [];   //if you have a list and reuse the variable then assign a brand new vakue to allowed use the variable

    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('My First App'),
          ),
          body: _questionIndex < _questions.length
              ? Quiz(
                  answerQuestion: _answerQuestion,
                  questionIndex: _questionIndex,
                  questions: _questions,
                ) //pass value from constructor
              : Result(_totalScore, _resetQuiz)),
    );
  }
}
