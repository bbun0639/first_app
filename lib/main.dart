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

  var _questionIndex = 0;

  final _questions = const [
    //Add 'const' in front of variable for value is const in Dart
    {
      'questionText': 'What\'s your fav color?', //Map = key-value 'pair'
      'answer': [
        'Black',
        'White',
        'Green',
        'Red',
      ],
    },
    {
      'questionText': 'What\'s your fav animal?',
      'answer': [
        'Dog',
        'Cat',
        'Snake',
        'Lion',
      ],
    },
    {
      'questionText': 'What\'s your fav instructor?',
      'answer': [
        'Max',
        'Jack',
        'Rack',
      ],
    },
  ];

  void _answerQuestions() {
    //setState is function to provided by the State<MyApp> inherit(ถ่ายทอด)
    //setState is function that forces Flutter to re-render the UI

    setState(() {
      _questionIndex = _questionIndex + 1;
    });

    if (_questionIndex < _questions.length) {
      print('We have more question!');
    } else {
      print('No more question!');
    }

    print(_questionIndex);
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
                answerQuestions: _answerQuestions,
                questionIndex: _questionIndex,
                questions: _questions,
              ) //pass value from constructor
            : Result()
      ),
    );
  }
}
