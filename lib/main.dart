import 'package:flutter/material.dart';

// void main(){
//   runApp(MyApp());
// }

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  void answerQuestions(){
    print('Answer chosen!');
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
            Text('The question!'),
            RaisedButton(
              child: Text('Answer 1'),
              onPressed: answerQuestions,
            ),
            RaisedButton(
              child: Text('Answer 1'),
              onPressed: answerQuestions,
            ),
            RaisedButton(
              child: Text('Answer 3'),
              onPressed: answerQuestions,
            ),
          ],
        ),
      ),
    );
  }
}
