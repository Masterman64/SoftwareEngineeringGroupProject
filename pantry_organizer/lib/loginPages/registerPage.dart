// ignore_for_file: prefer_const_constructors, prefer_interpolation_to_compose_strings, avoid_print, prefer_const_literals_to_create_immutables, library_private_types_in_public_api, unused_field, prefer_typing_uninitialized_variables

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pantry_organizer/models/user.dart' as model;

class RegisterPage extends StatefulWidget {
  final VoidCallback showLoginPage;
  const RegisterPage({Key? key, required this.showLoginPage}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _aboutController = TextEditingController();
  final _dietController = TextEditingController();
  final _dateOfBirthController = TextEditingController();
  final String _pickedImage = "";

  Future signUp(
      String email,
      String password,
      String image,
      String about,
      String dietConditions,
      DateTime dateOfBirth,
      DateTime accountCreationTime) async {
    if (passwordConfirmation()) {
      // creates user
      UserCredential userCred = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      //String imageUrl = await uploadImage(image!);

      // add userinfo into our User model
      model.User user = model.User(
          accountCreationTime: accountCreationTime,
          email: email,
          uid: userCred.user!.uid,
          imageUrl: "",
          about: about,
          dietConditions: dietConditions,
          dateOfBirth: dateOfBirth);

      // add user to the database
      await FirebaseFirestore.instance
          .collection('userinfo')
          .doc(userCred.user!.uid)
          .set(user.toJson());
    } else {}
  }

  void pickImage() async {
    //final pickedImage =
    // await ImagePicker().pickImage(source: ImageSource.gallery);

    //_pickedImage = File(pickedImage!.path);
    //print(_pickedImage);
  }

  /*Future<String> uploadImage(File image) async {
    Reference ref = FirebaseStorage.instance.ref().child('profilePics').child(FirebaseAuth.instance.currentUser!.uid);

    UploadTask uploadTask = ref.putFile(image);
    TaskSnapshot snapshot = await uploadTask;
    String downloadImageUrl = await snapshot.ref.getDownloadURL();
    return downloadImageUrl;
  }*/

  bool passwordConfirmation() {
    if (_passwordController.text.trim() ==
        _confirmPasswordController.text.trim()) {
      return true;
    } else {
      return false;
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _dateOfBirthController.dispose();
    _dietController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: SafeArea(
            child: Center(
                child: SingleChildScrollView(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
              // welcome message
              Text(
                'Sign up here!',
                style: GoogleFonts.roboto(
                  fontSize: 52,
                ),
              ),
              SizedBox(height: 50),

              // profile picture
              Stack(children: [
                const CircleAvatar(
                  radius: 96,
                  backgroundImage:
                      NetworkImage('https://i.imgur.com/62B53PO.png'),
                ),
                Positioned(
                  child: IconButton(
                    onPressed: () => pickImage(),
                    icon: const Icon(Icons.camera_alt_outlined),
                  ),
                ),
              ]),
              SizedBox(height: 15.0),

              // email textfield login
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[500],
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: TextField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Email',
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),

              // password textfield login
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[500],
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: TextField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Password',
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),

              // confirm password textfield
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[500],
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: TextField(
                      controller: _confirmPasswordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Confirm Password',
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),

              //DOB textfield
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[500],
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Column(
                      children: <Widget>[
                        TextField(
                            controller: _dateOfBirthController,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Date of Birth',
                            ))
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),

              // description textfield
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[500],
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: TextField(
                      controller: _aboutController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'About You',
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),

              // dietary conditions textfield
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[500],
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: TextField(
                      controller: _dietController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText:
                            'Dietary Conditions (separate with a "," or NA if none)',
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),

              // sign up button
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: InkWell(
                  onTap: () => signUp(
                      _emailController.text.trim(),
                      _passwordController.text.trim(),
                      _pickedImage,
                      _aboutController.text,
                      _dietController.text,
                      //DateTime.parse(_dateOfBirthController.text.replaceAll("/", "-")),
                      DateTime.now(),
                      DateTime.now()),
                  child: Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primaryContainer,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                        child: Text(
                          'Sign Up',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      )),
                ),
              ),
              SizedBox(height: 20),

              // register if no account
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have an account?',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  GestureDetector(
                    onTap: widget.showLoginPage,
                    child: Text(
                      ' Login here',
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: 0),
            ])))));
  }
}
