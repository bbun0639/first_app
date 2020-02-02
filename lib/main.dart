import 'package:flutter/material.dart';

import './question.dart';

import './answer.dart';


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

  final questions = const [                         //Add 'const' in front of variable for value is const in Dart
      {
        'questionText': 'What\'s your fav color?',    //Map = key-value 'pair'
        'answer': ['Black', 'White', 'Green', 'Red',],
      },
      {
        'questionText': 'What\'s your fav animal?',
        'answer': ['Dog', 'Cat', 'Snake', 'Lion',],
      },
      {
        'questionText': 'What\'s your fav instructor?',
        'answer': ['Max', 'Jack', 'Rack',],
      },
    ];

  void _answerQuestions() {
    //setState is function to provided by the State<MyApp> inherit(ถ่ายทอด)
    //setState is function that forces Flutter to re-render the UI
    
    setState(() {
      _questionIndex = _questionIndex + 1;
    });

    if (_questionIndex < questions.length) {
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
        body: _questionIndex < questions.length ? Column(  // Use '?' for mark border to the code which if this TRUE
          children: [
            Question(
              //It's constructor to get value for the questionText
              //questions.elementAt(0),
              questions[_questionIndex]['questionText'],
            ),

            ...(questions[_questionIndex]['answer'] as List<String>).map((answer) {   //Error at map() : Dart can't detect because 'answer' holds a list
              return Answer(_answerQuestions, answer);                                //'List<String>' to tell Dart 'answer' is a list
            }).toList() //Convert value in map() to list    //... take a list that we habe & pull all value in the list



            // Answer(_answerQuestions), //ต้องไปเพิ่ม  Constructor ด้วยเพื่อยอมรับการ Callback
            // Answer(_answerQuestions), //Answer จะไป Pointer at a Function Answer
            // RaisedButton(
            //   child: Text('Answer 2'),
            //   color: Colors.deepOrange
            //   onPressed: () =>
            //       print('Answer 2 chosen!'), //Anonymous () function
            // ),
          ],
        ) : Center(
            child: Text(
              'No more question!', 
              style: TextStyle(fontSize: 28),) 
          ),
      ),
    );
  }
}
