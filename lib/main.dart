import 'package:flutter/material.dart';

// void main(){
//   runApp(MyApp());
// }

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {

  @override                             //@override agian bc. createState is a method provided by stateful wigget
  State<StatefulWidget> createState() {
    // TODO: implement createElement
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> { //This class belong to the MyApp(Wiget)

  var questionIndex = 0;

  void answerQuestions() {
    setState(() {     //setState is function to provided by the State<MyApp> inherit(ถ่ายทอด)  //setState takes a function
      questionIndex = questionIndex + 1;
    });
    
    print(questionIndex);
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
            Text(
              //questions.elementAt(0),
              questions[questionIndex],
            ),
            RaisedButton(
              child: Text('Answer 1'),
              onPressed: answerQuestions,
            ),
            RaisedButton(
              child: Text('Answer 2'),
              onPressed: () =>
                  print('Answer 2 chosen!'), //Anonymous () function
            ),
            RaisedButton(
              child: Text('Answer 3'),
              onPressed: () {
                //Anonymous () function
                //..
                print('Answer 3 chosen!');
              },
            ),
          ],
        ),
      ),
    );
  }
}
