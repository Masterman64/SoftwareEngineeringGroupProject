import 'package:flutter/material.dart';
import 'package:pantry_organizer/pages/pantry.dart';
import 'package:pantry_organizer/pages/profile.dart';
import 'package:pantry_organizer/pages/refrigerator.dart';

class ProfileHome extends StatelessWidget {
  const ProfileHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.green,
          title: const Text(
            'Home',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: ListView(
          children: [
            Center(
              child: Text('Home Page testing'),
            )
          ],
        ));
  }
}

class Home extends StatelessWidget {
  static const String page0 = '/';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text(
          'Home',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30.0,
          ),
        ),
        const SizedBox(
          height: 30.0,
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const Pantry(),
              ),
            );
          },
          child: const Text('Pantry'),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const Refrigerator(),
              ),
            );
          },
          child: const Text('Refrigerator'),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ProfilePage(),
              ),
            );
          },
          child: const Text('Profile'),
        ),
      ],
    )));
  }
}
