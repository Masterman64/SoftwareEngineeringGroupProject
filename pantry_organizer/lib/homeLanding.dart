// ignore_for_file: prefer_const_constructors, prefer_interpolation_to_compose_strings, avoid_print, prefer_const_literals_to_create_immutables, library_private_types_in_public_api, prefer_final_fields

import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:pantry_organizer/constants.dart';


class HomeLanding extends StatefulWidget {
  const HomeLanding({Key? key}) : super(key: key);

  @override
  State<HomeLanding> createState() => _HomeLandingState();
}

class _HomeLandingState extends State<HomeLanding> {
  int _selectedIndex = 0;

  void onTabChanged(index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // bottom navigation bar
        bottomNavigationBar: Container(
          color: Colors.green.shade700,
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
            child: GNav(
                backgroundColor: Colors.green.shade700,
                activeColor: Colors.white60,
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
                onTabChange: onTabChanged
            ),
          ),
        ),
        body: pages[_selectedIndex],
      );
  }
}
