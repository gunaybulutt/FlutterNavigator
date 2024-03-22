import 'package:flutter/material.dart';
import 'package:navigator/MainPage.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget{


  @override
  Widget build(BuildContext context) {

    return MaterialApp(

      home: MainPage(),

    );
  }
}