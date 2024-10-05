// lib/auth_check.dart
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'introduction_animation/introduction_animation_screen.dart';
import 'screens/login_success/login_success_screen.dart';

class AuthCheck extends StatelessWidget {
  static const String routeName = '/auth_check';

  const AuthCheck({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          ); // Or any other loading indicator
        } else if (snapshot.hasData) {
          // User is logged in
          WidgetsBinding.instance.addPostFrameCallback((_) {
            Navigator.pushReplacementNamed(context, LoginSuccessScreen.routeName);
          });
        } else {
          // User is not logged in
          WidgetsBinding.instance.addPostFrameCallback((_) {
            Navigator.pushReplacementNamed(context, IntroductionAnimationScreen.routeName);
          });
        }
        return Container(); // Placeholder container while the navigation happens
      },
    );
  }
}
