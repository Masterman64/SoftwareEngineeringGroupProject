import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:untitled/home.dart';
import 'package:untitled/pantry.dart';
import 'package:untitled/profile.dart';
import 'package:untitled/refrigerator.dart';


void main() => runApp(MyApp());
class MyApp extends StatelessWidget{
  const MyApp({super.key});
  final double coverHeight =280;

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'Flutter App',
      theme: ThemeData(
        primaryColor: const Color(0x004b0082)
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => Home(),
        'page1': (context) => const Pantry(),
        'page2': (context) => const Refrigerator(),
        'page3': (context) => const ProfilePage()
      },
    );
  }
}