import 'package:flutter/material.dart';

import './question.dart';
import './answer.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int questionIndex;
  final Function answerQuestions;

  Quiz(
      {@required this.answerQuestions,
      @required this.questions,
      @required this.questionIndex});   //@require that must not omit(ละเว้น) ,เอาทุกตัว

  @override
  Widget build(BuildContext context) {
    return Column(
      // Use '?' for mark border to the code which if this TRUE
      children: [
        Question(
          //It's constructor to get value for the questionText
          //questions.elementAt(0),
          questions[questionIndex]['questionText'],
        ),

        ...(questions[questionIndex]['answer'] as List<String>).map((answer) {
          //Error at map() : Dart can't detect because 'answer' holds a list
          return Answer(answerQuestions,
              answer); //'List<String>' to tell Dart 'answer' is a list
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
    );
  }
}
