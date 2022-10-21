// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'loginLanding.dart';
import 'homeLanding.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
    body: StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if(snapshot.hasData) {
          return HomeLanding();
        }
        else {
          return LoginLanding();
        }
      }
    ) 
  );
}
  
