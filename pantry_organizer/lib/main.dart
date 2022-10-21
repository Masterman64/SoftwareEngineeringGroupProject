// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'loginLanding.dart';
import 'homeLanding.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyBxFUAqvcEzQNovauSwd8Eabtc1m3tUljo",
      authDomain: "seproject-group10-f7a99.firebaseapp.com",
      projectId: "seproject-group10-f7a99",
      storageBucket: "seproject-group10-f7a99.appspot.com",
      messagingSenderId: "303276218464",
      appId: "1:303276218464:web:a483f2c98dee8a10e9cb05",
      measurementId: "G-KRWRVP2ZG9"
    )
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
        home: HomeLanding(),
    );
  }
}
