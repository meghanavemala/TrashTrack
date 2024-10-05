// ignore_for_file: use_build_context_synchronously, unused_import

/*import 'package:flutter/material.dart';
import 'package:trashtrack/screens/init_screen.dart';

class LoginSuccessScreen extends StatelessWidget {
  static String routeName = "/login_success";

  const LoginSuccessScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const SizedBox(),
        title: const Text("Login Success"),
      ),
      body: Column(
        children: [
          const SizedBox(height: 16),
          Image.asset(
            "assets/images/success.png",
            height: MediaQuery.of(context).size.height * 0.4, //40%
          ),
          const SizedBox(height: 16),
          const Text(
            "Login Success",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, HelloPage.routeName);
              },
              child: const Text("Back to home"),
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
*/

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:trashtrack/ai_chatbot.dart';
//import 'package:trashtrack/best_page.dart';
import 'package:trashtrack/qr_create.dart';
import 'package:trashtrack/trashtrackinitself/fitness_app_home_screen.dart';
import 'package:trashtrack/trashtrackinitself/my_diary/my_diary_screen.dart';
//import 'package:trashtrack/screens/init_screen.dart';

import '../../introduction_animation/introduction_animation_screen.dart'; // Assuming InitScreen handles initial routing

class LoginSuccessScreen extends StatelessWidget {
  static String routeName = "/login_success";
  final FirebaseAuth _auth = FirebaseAuth.instance;
  LoginSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const SizedBox(),
        title: const Text("Login Success"),
      ),
      body: Column(
        children: [
          const SizedBox(height: 16),
          Image.asset(
            "assets/images/success.png",
            height: MediaQuery.of(context).size.height * 0.4, //40%
          ),
          const SizedBox(height: 16),
          const Text(
            "Login Success",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ElevatedButton(
              onPressed: () async {
                await _auth.signOut();
                // Navigate to the initial screen (or login screen) after logout
                Navigator.pushNamed(context, FitnessAppHomeScreen.routeName);

              },
              child: const Text("Continue"),
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
