import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  static const String page3 = '/profile';
  const ProfilePage({super.key});
  final double coverHeight = 280;
  final double profileHeight = 140;
  final double top = 210;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: [
            buildCoverImage(),
            Positioned(top: top, child: buildProfileImage()),
            MaterialButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
              },
              color: Theme.of(context).colorScheme.primaryContainer,
              child: Text('Sign out'),
            )
          ]),
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
        radius: profileHeight / 2,
        backgroundColor: Colors.white,
        backgroundImage: const NetworkImage('https://i.imgur.com/62B53PO.png'),
      );
}
