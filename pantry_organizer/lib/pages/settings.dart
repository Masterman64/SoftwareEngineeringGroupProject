// ignore_for_file: prefer_const_constructors, prefer_interpolation_to_compose_strings, avoid_print, prefer_const_literals_to_create_immutables, library_private_types_in_public_api

import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';

class ProfileSettings extends StatefulWidget {
  const ProfileSettings({super.key});

  @override
  State<ProfileSettings> createState() => _ProfileSettingsState();
}

class _ProfileSettingsState extends State<ProfileSettings> {
  File? _image;
  late String? userImageUrl;
  late String? userEmail;
  late int? userAge;
  late String? userDietCond;
  late String? userAbout;

  final _changeEmailController = TextEditingController();
  final _changeAgeController = TextEditingController();
  final _changeDietCondController = TextEditingController();

  Future displayUserChanges() async {
    User? user = FirebaseAuth.instance.currentUser;

    List <String> docIDs = [];
    await FirebaseFirestore.instance.collection('userinfo').where('email', isEqualTo: user?.email).get().then(
      (snapshot) => snapshot.docs.forEach((element) {
        userEmail = element["email"];
        userAge = element["age"];
        userDietCond = element["dietary conditions"];
        userAbout = element["about"];
        userImageUrl = element["image url"];
        docIDs.add(element.reference.id);
       })
    );
  }
   

  Future saveUserChanges() async {

  }

  Future signOut() async {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.blue[900],
          title: Text(
            'Profile',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: ListView(children: [
          Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                SizedBox(height: 15.0),

                
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                  child: Text(
                    'Profile Information',
                    style: GoogleFonts.roboto(
                      fontSize: 20, 
                      color: Colors.blue
                    ),
                  ),
                ),
                SizedBox(height: 15.0),

                // profile avatar
                CircleAvatar(
                  backgroundColor: Colors.grey,
                  radius: 75.0,
                  child: Icon(
                    Icons.person,
                    color: Colors.white,
                    size: 100.0,
                  ),
                ),
                SizedBox(height: 10.0),

                // change email button
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.only(left: 10.0),
                    child: TextField(
                      controller: _changeEmailController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Email',
                      ),
                    ),
                  ),
                ),

                // change age button
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[500],
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.only(left: 10.0),
                    child: TextField(
                      controller: _changeAgeController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Age',
                      ),
                    ),
                  ),
                ),

                // change dietary conditions button
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[500],
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.only(left: 10.0),
                    child: TextField(
                      controller: _changeDietCondController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Dietary Conditions (separate with a "," or NA if none)',
                      ),
                    ),
                  ),
                ),

                // save changes button
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: InkWell(
                    onTap: displayUserChanges,
                    child: Container(
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 170, 28, 18),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Center(
                          child: Text(
                            'Save Changes',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        )),
                  ),
                ),
                SizedBox(height: 30),

                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                  child: Text(
                    'Change Password',
                    style: GoogleFonts.roboto(
                      fontSize: 20, 
                      color: Colors.blue
                    ),
                  ),
                ),

                // change password button
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Colors.grey,
                      ),
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: '  New Password',
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Colors.grey,
                      ),
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: '  Repeat Password',
                      ),
                    ),
                  ),
                ),

                // sign out button
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: InkWell(
                    onTap: signOut,
                    child: Container(
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.blue[900],
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Center(
                          child: Text(
                            'Sign Out',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        )),
                  ),
                ),
                SizedBox(height: 15),
              ]))
        ]));
  }
}
