import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:pantry_organizer/pages/home.dart';

class Refrigerator extends StatelessWidget {
  static const String page2 = '/refrigerator';

  const Refrigerator({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Refrigerator',
          style: TextStyle(color: Colors.white, fontSize: 20.0),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            const Text(
              'Refrigerator Ingredients',
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
              },
              child: const Text('Home'),
            ),
          ],
        ),
      ),
    );
  }
}
