// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:pantry_organizer/firebase_options.dart';
import 'package:pantry_organizer/mainPage.dart';
import 'homeLanding.dart';
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
          primary: Color.fromARGB(255, 67, 250,
              91), // easily the best line of code out of this whole damn thing 😎
          primaryContainer: Color.fromARGB(255, 73, 173, 86),
          secondary: Color.fromARGB(255, 250, 238, 92),
          secondaryContainer: Color.fromARGB(255, 173, 166, 73),
          tertiary: Color.fromARGB(255, 225, 80, 250),
        ),
      ),
      home: MainPage(),
    );
  }
}
