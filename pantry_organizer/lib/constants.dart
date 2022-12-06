// ignore_for_file: prefer_const_constructors, prefer_interpolation_to_compose_strings, avoid_print, prefer_const_literals_to_create_immutables, library_private_types_in_public_api, prefer_final_fields

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pantry_organizer/pages/foodGroup.dart';
import 'package:pantry_organizer/pages/home.dart';
import 'package:pantry_organizer/pages/settings.dart';

List<Widget> pages = [
  const ProfileHome(),
  const ProfileFoodGroup(),
  ProfileSettings(
    uid: FirebaseAuth.instance.currentUser!.uid,
  ),
];