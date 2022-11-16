// ignore_for_file: prefer_const_constructors, prefer_interpolation_to_compose_strings, avoid_print, prefer_const_literals_to_create_immutables, library_private_types_in_public_api

import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final DateTime accountCreationTime;
  final String email;
  final String uid;
  final String imageUrl;
  final String about;
  final String dietConditions;
  final DateTime dateOfBirth;

  const User(
      {required this.accountCreationTime,
      required this.email,
      required this.uid,
      required this.imageUrl,
      required this.about,
      required this.dietConditions,
      required this.dateOfBirth});

  static User snapshotData(DocumentSnapshot snapshot) {
    var snap = snapshot.data() as Map<String, dynamic>;

    return User(
      accountCreationTime: snap["accountCreationTimestamp"],
      email: snap["email"],
      uid: snap["uid"],
      imageUrl: snap["imageUrl"],
      about: snap["about"],
      dietConditions: snap["dietConditions"],
      dateOfBirth: snap["dateOfBirth"],
    );
  }

  Map<String, dynamic> toJson() => {
        "accountCreationTimestamp": accountCreationTime,
        "email": email,
        "uid": uid,
        "imageUrl": imageUrl,
        "about": about,
        "dietConditions": dietConditions,
        "dateOfBirth": dateOfBirth
      };
}
