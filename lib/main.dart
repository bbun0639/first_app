import 'package:flutter/material.dart';

import './question.dart';

import './answer.dart';

// void main(){
//   runApp(MyApp());
// }

void main() => runApp(MyApp());

//Stateful can re-eun build() when its properties change

class MyApp extends StatefulWidget {

  @override                             //@override agian bc. createState is a method provided by stateful wigget
  State<StatefulWidget> createState() {

    return _MyAppState();
  }
}

// _ : special syntax turn public class --> private clss

class _MyAppState extends State<MyApp> { //This class belong to the MyApp(Wiget)

  var _questionIndex = 0;

  void _answerQuestions() {
    //setState is function to provided by the State<MyApp> inherit(ถ่ายทอด)  
    //setState is function that forces Flutter to re-render the UI
    setState(() { 
      _questionIndex = _questionIndex + 1;
    });
    
    print(_questionIndex);
    //print('Any Answer chosen!');
  }

  //inheritance by 'extends'
  @override //decorator
  Widget build(BuildContext context) {
    var questions = [
      'What\'s your fav color?',
      'What\'s your fav animal?',
    ];
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: Column(
          children: [
            Question(     //It's constructor to get value for the questionText
              //questions.elementAt(0),
              questions[_questionIndex],
            ),
            
            Answer(_answerQuestions), //ต้องไปเพิ่ม  Constructor ด้วยเพื่อยอมรับการ Callback
            Answer(_answerQuestions), //Answer จะไป Pointer at a Function Answer
            Answer(_answerQuestions),
            RaisedButton(
              child: Text('Answer 2'),
              onPressed: () =>
                  print('Answer 2 chosen!'), //Anonymous () function
            ),
          ],
        ),
      ),
    );
  }
}
