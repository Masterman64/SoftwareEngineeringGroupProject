// ignore_for_file: prefer_const_constructors, prefer_interpolation_to_compose_strings, avoid_print, prefer_const_literals_to_create_immutables, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:pantry_organizer/loginPages/loginPage.dart';
import 'package:pantry_organizer/loginPages/registerPage.dart';

class AuthLanding extends StatefulWidget {
  const AuthLanding({Key? key}) : super(key: key);

  @override
  State<AuthLanding> createState() => _AuthLandingState();
}

class _AuthLandingState extends State<AuthLanding> {

  bool showLogin = true;

  void toggleScreenOffAndOn(){
    setState(() {
      showLogin = !showLogin;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLogin){
      return LoginPage(showRegisterPage: toggleScreenOffAndOn);
    } else {
      return RegisterPage(showLoginPage: toggleScreenOffAndOn);
    }
  }
}