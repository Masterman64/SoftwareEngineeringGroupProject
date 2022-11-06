// ignore_for_file: prefer_const_constructors, prefer_interpolation_to_compose_strings, avoid_print, prefer_const_literals_to_create_immutables, library_private_types_in_public_api

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:pantry_organizer/pages/foodGroup.dart';
import 'package:pantry_organizer/pages/home.dart';
import 'package:pantry_organizer/pages/settings.dart';

class HomeLanding extends StatefulWidget {
  const HomeLanding({Key? key}) : super(key: key);

  @override
  State<HomeLanding> createState() => _HomeLandingState();
}

class _HomeLandingState extends State<HomeLanding> {
  int _selectedIndex = 0;

  static const List<Widget> _pages = <Widget>[
    ProfileHome(),
    ProfileFoodGroup(),
    ProfileSettings()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),

      body: Center(
        child: _pages.elementAt(_selectedIndex),
      ), 
      
      // bottom navigation bar
      bottomNavigationBar: Container(
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
          child: GNav(
            backgroundColor: Colors.black,
            color: Colors.white70,
            gap: 5,
            padding: EdgeInsets.all(16),
            tabs: const [
              GButton(
                icon: Icons.home,
                text: 'Home',
              ),
              GButton(
                icon: Icons.fastfood_sharp,
                text: 'Food Groups',
              ),
              GButton(
                icon: Icons.person,
                text: 'Profile',
              ),
            ],
            selectedIndex: _selectedIndex,
            onTabChange: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
          ),
        ),
      )
    );
  }
}