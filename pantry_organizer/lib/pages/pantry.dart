import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:pantry_organizer/pages/home.dart';
import 'package:pantry_organizer/pages/subpages/groupPage.dart';

class Pantry extends StatelessWidget {
  static const String page1 = '/pantry';

  const Pantry({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 25.0, vertical: 10.0),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black45),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  // ignore: prefer_const_constructors
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    // ignore: prefer_const_constructors
                    child: TextField(
                      //controller: _passwordController,
                      obscureText: true,
                      // ignore: prefer_const_constructors
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Search',
                      ),
                    ),
                  ),
                ),
              ),
              /*ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const GroupPage(),
                    ),
                  );
                },
                child:*/
              // ignore: prefer_const_constructors
              CircleAvatar(
                  backgroundColor: Colors.black,
                  radius: 70,
                  // ignore: prefer_const_constructors
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 68,
                    // ignore: prefer_const_constructors
                    child: Text("Refridgerator"),
                  )),
              //),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          tooltip: 'Increment',
          onPressed: () {
            return;
          },
          child: const Icon(Icons.add),
        ));
  }
}
