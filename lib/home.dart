import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:untitled/home.dart';
import 'package:untitled/pantry.dart';
import 'package:untitled/profile.dart';
import 'package:untitled/refrigerator.dart';



class Home extends StatelessWidget{
  static const String page0 = '/';
  @override
  Widget build (BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Pantry Organizer',
          style: TextStyle(color: Colors.blue, fontSize: 20.0),
        ),
        centerTitle: true,
      ),
      body: Center(
        child:Column(
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
                Navigator.push
                  (context, MaterialPageRoute(builder: (context) => const Pantry(),
                ),
                );
              }, child: const Text('Pantry'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push
                  (context, MaterialPageRoute(builder: (context) => const Refrigerator(),
                ),
                );
              }, child: const Text('Refrigerator'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push
                  (context, MaterialPageRoute(builder: (context) => const ProfilePage(),
                ),
                );
              }, child: const Text('Profile'),
            ),
          ],
        )
      )
    );
  }
}