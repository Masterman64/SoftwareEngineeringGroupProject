// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:pantry_organizer/firebase_options.dart';
import 'package:pantry_organizer/mainPage.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
   options: DefaultFirebaseOptions.currentPlatform,
  );
  
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData.dark().copyWith(
          colorScheme: ColorScheme.light().copyWith(
            primary: Colors.purple), // easily the best line of code out of this whole damn thing 😎
        ),
        home: MainPage(),
    );
  }
}
