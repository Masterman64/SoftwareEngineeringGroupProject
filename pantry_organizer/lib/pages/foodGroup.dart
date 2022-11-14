// ignore_for_file: prefer_const_constructors, prefer_interpolation_to_compose_strings, avoid_print, prefer_const_literals_to_create_immutables, library_private_types_in_public_api

import 'package:flutter/material.dart';

class ProfileFoodGroup extends StatelessWidget {
  const ProfileFoodGroup({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.green.shade300,
          title: Text(
            'Pantry',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
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
                   
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                     
                    child: TextField(
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
               
              CircleAvatar(
                  backgroundColor: Colors.black,
                  radius: 70,
                   
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 68,
                     
                    child: Text("Refridgerator"),
                  )),
              //),
            ],
          ),
        ),
    );
  }
}