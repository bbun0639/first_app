import 'package:flutter/material.dart';

class Answer extends StatelessWidget {

  final Function selectHandler;//Add 'final property' that store
  final String answerText;

  Answer(this.selectHandler, this.answerText); //Add constructor (shortcut) by repeating class name

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: RaisedButton(
        child: Text(answerText),
        color: Colors.blue,
        textColor: Colors.white,
        onPressed: selectHandler,
      ),
    );
  }
}
