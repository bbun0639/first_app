import 'package:flutter/material.dart';

//stateless widget have problem inside just property not 'final'
//It's mean it cloud be change in side that class
class Question extends StatelessWidget {
  final String questionText;

  Question(this.questionText); //Constructor //When data is received here the Const that will be store in questionText

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(18),
      child: Text(
        questionText,
        style: TextStyle(fontSize: 24),
        textAlign: TextAlign.center,
      ),
    );
  }
}
