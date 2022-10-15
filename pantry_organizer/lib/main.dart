// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';

void main() => runApp(MainApp());

class MainApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        colorScheme: ColorScheme.light().copyWith(primary: Colors.purple), // easily the best line of code out of this whole damn thing 😎
      ), 
      home: Scaffold(
        appBar: AppBar(title: Text('Pantry Organizer')),
        body: Center(
          child: Text('Testing for now')
        )
      ));
  }
}