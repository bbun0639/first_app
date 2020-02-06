import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function resetQuiz;

  Result(this.resultScore, this.resetQuiz);

  String get resultPhrase {
    String resultText;
    if (resultScore <= 8) {
      resultText = 'You\sre awesom! and innocent!';
    } else if (resultScore <= 12) {
      resultText = 'Pretty likeable!';
    } else if (resultScore <= 16) {
      resultText = 'You are strange?!';
    } else {
      resultText = 'You are great!';
    }
    return 'Score = ' + (this.resultScore.toString()) + '\n' + resultText;
  }

  @override
  Widget build(BuildContext context) {
    var bold = FontWeight.bold;
    return Center(
        child: Column(
      children: <Widget>[
        Text(
          resultPhrase,
          style: TextStyle(fontSize: 26, fontWeight: bold),
          textAlign: TextAlign.center,
        ),
        FlatButton(
          child: Text(
            'Restart Quiz!',
          ),
          textColor: Colors.blue,
          onPressed: resetQuiz,
        ),
      ],
    ));
  }
}
