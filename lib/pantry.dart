import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:untitled/home.dart';
import 'package:untitled/pantry.dart';
import 'package:untitled/refrigerator.dart';


class Pantry extends StatelessWidget{
  static const String page1 = '/pantry';

  const Pantry({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Pantry',
          style: TextStyle(color: Colors.white, fontSize: 20.0),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [const Text(
            'Pantry Ingredients',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30.0,
                color: Colors.yellow),
          ),
            const SizedBox(
              height: 30.0,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, Home.page0);
              }, child: const Text('Home'),
            ),
          ],
        ),
      ),
    );
  }
}