import 'package:flutter/material.dart';

class Answer extends StatelessWidget {

  final Function selectHandler;//Add 'final property' that store

  Answer(this.selectHandler); //Add constructor (shortcut) by repeating class name

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,

      child: RaisedButton(
        child: Text('Answer 1'),
        color: Colors.blue,
        onPressed: selectHandler,
      ),
    );
  }
}
