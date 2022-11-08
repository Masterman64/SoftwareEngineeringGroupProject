import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:untitled/home.dart';
import 'package:untitled/pantry.dart';
import 'package:untitled/refrigerator.dart';

class ProfilePage extends StatelessWidget {
  static const String page3 = '/profile';
  const ProfilePage({super.key});
  final double coverHeight = 280;
  final double profileHeight = 140;
  final double top = 210;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Profile Page',
          style: TextStyle(color: Colors.white, fontSize: 20.0),
        ),
        centerTitle: true,
      ),
      body: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          buildCoverImage(),
          Positioned(
            top: top,
            child: buildProfileImage()
          ),
        ]
        ),
      );
  }
  Widget buildCoverImage() => Container(
    color: Colors.deepPurple,
    child: Image.network(
      'https://static8.depositphotos.com/1392258/865/i/450/depositphotos_8656042-stock-photo-upscale-kitchen-with-breakfast-bar.jpg',
      width: double.infinity,
      height: coverHeight,
      fit: BoxFit.cover,
    ),
  );
  Widget buildProfileImage() => CircleAvatar(
    radius: profileHeight/2,
    backgroundColor: Colors.white,
    backgroundImage: const NetworkImage(
      'https://i.imgur.com/62B53PO.png'
    ),
  );


}