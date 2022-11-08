// ignore_for_file: prefer_const_constructors, prefer_interpolation_to_compose_strings, avoid_print, prefer_const_literals_to_create_immutables, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'loginPages/authLanding.dart';
import 'loginPages/loginPage.dart';
import 'homeLanding.dart';
import 'package:firebase_auth/firebase_auth.dart';

Stream<User?> auth() => FirebaseAuth.instance.authStateChanges();

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final authChanges = auth();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: authChanges,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return HomeLanding();
          } else {
            return AuthLanding();
          }
        },
      ),
    );
  }
}
