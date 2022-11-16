// ignore_for_file: prefer_const_constructors, prefer_interpolation_to_compose_strings, avoid_print, prefer_const_literals_to_create_immutables, library_private_types_in_public_api, use_build_context_synchronously

import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:pantry_organizer/models/user.dart' as model;

class ProfileSettings extends StatefulWidget {
  final String uid;
  const ProfileSettings({Key? key, required this.uid}) : super(key: key);

  @override
  State<ProfileSettings> createState() => _ProfileSettingsState();
}

class _ProfileSettingsState extends State<ProfileSettings> {
  Map<String, dynamic>? userData = {};
  String email = "";
  String uid = "";
  String imageUrl = "";
  String about = "";
  String dietConditions = "";
  int age = 0;
  bool isLoading = false;

  final _changeEmailController = TextEditingController();
  final _changeDateOfBirthController = TextEditingController();
  final _changeDietCondController = TextEditingController();
  final _changeAboutController = TextEditingController();

  final _newPasswordController = TextEditingController();
  final _newPasswordConfirmationController = TextEditingController();

  @override
  void initState() {
    super.initState();
    getUserData();
  }

  getUserData() async {
    setState(() {
      isLoading = true;
    });

    // get current user details to display on profile
    try {
      var userDetails = await FirebaseFirestore.instance
          .collection('userinfo')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .get();

      userData = userDetails.data();
      setState(() {});
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    }
    setState(() {
      isLoading = false;
    });
  }

  Future saveProfileChanges(String email, String uid, String about,
      String dietConditions, DateTime dateOfBirth) async {
    // update user model w/ new changes
    model.User user = model.User(
        accountCreationTime: userData?['accountCreationTime'],
        email: email,
        uid: uid,
        imageUrl: "",
        about: about,
        dietConditions: dietConditions,
        dateOfBirth: dateOfBirth);

    // save changes into the database
    await FirebaseFirestore.instance
        .collection('userinfo')
        .doc(uid)
        .set(user.toJson());

    // update our email with firebaseauth so we can sign in with our new email
    FirebaseAuth.instance.currentUser!.updateEmail(email);

    // send message to let user know their details have been saved
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text('Successfully saved changes')));
  }

  Future changePassword(String newPassword) async {
    if (changePasswordConfirmation()) {
      FirebaseAuth.instance.currentUser!.updatePassword(newPassword);
    }
  }

  Future signOut() async {
    FirebaseAuth.instance.signOut();
  }

  bool changePasswordConfirmation() {
    if (_newPasswordController.text.trim() ==
        _newPasswordConfirmationController.text.trim()) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : Scaffold(
            appBar: AppBar(
              centerTitle: true,
              backgroundColor: Colors.green.shade300,
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
                            fontSize: 20, color: Colors.green.shade300),
                      ),
                    ),
                    SizedBox(height: 15.0),

                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          color: Colors.deepPurple,
                          child: Image.network(
                            'https://static8.depositphotos.com/1392258/865/i/450/depositphotos_8656042-stock-photo-upscale-kitchen-with-breakfast-bar.jpg',
                            width: double.infinity,
                            height: 200,
                            fit: BoxFit.cover,
                          ),
                        ),

                        // profile avatar
                        Positioned(
                          top: 35,
                          child: CircleAvatar(
                            radius: 70,
                            backgroundColor: Colors.white,
                            backgroundImage: const NetworkImage(
                                'https://i.imgur.com/62B53PO.png'),
                          ),
                        ),
                      ],
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
                            hintText: userData?['email'] ?? '',
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
                          controller: _changeDateOfBirthController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: userData?['age'].toString() ?? '',
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
                            hintText: userData?['dietConditions'] ?? '',
                          ),
                        ),
                      ),
                    ),

                    // change about button
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
                          controller: _changeAboutController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: userData?['about'] ?? '',
                          ),
                        ),
                      ),
                    ),

                    // save changes button
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: InkWell(
                        onTap: () => saveProfileChanges(
                            _changeEmailController.text,
                            FirebaseAuth.instance.currentUser!.uid,
                            _changeAboutController.text,
                            _changeDietCondController.text,
                            DateTime.parse(_changeDateOfBirthController.text)),
                        child: Container(
                            padding: EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              color: Colors.green.shade800,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Center(
                              child: Text(
                                'Save Profile Changes',
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
                            fontSize: 20, color: Colors.green.shade300),
                      ),
                    ),

                    // change password button
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
                          controller: _newPasswordController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'New password',
                          ),
                        ),
                      ),
                    ),

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
                          controller: _newPasswordConfirmationController,
                          obscureText: true,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Confirm new password',
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 15.0),

                    // change password button
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: InkWell(
                        onTap: () => changePassword(
                            _newPasswordConfirmationController.text.trim()),
                        child: Container(
                            padding: EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              color: Colors.green.shade800,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Center(
                              child: Text(
                                'Save Password Changes',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                            )),
                      ),
                    ),
                    SizedBox(height: 15.0),

                    // sign out button
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: InkWell(
                        onTap: signOut,
                        child: Container(
                            padding: EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              color: Colors.red[900],
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
