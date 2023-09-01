import 'package:flutter/material.dart';
import'./pages/MyHomePage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  
  @override
  Widget build(BuildContext context ) {
    return MaterialApp(
      // title: 'To-do List',
      debugShowCheckedModeBanner: false,
      home: MyHome(),
    );
  }
}