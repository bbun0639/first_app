import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget { //inheritance by 'extends'
  Widget build(BuildContext context){
    return MaterialApp(home: Text('Hello! This is my first App'),);
  }
}