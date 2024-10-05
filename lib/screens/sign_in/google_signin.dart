// ignore_for_file: avoid_print, library_private_types_in_public_api, use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:trashtrack/screens/login_success/login_success_screen.dart';
import 'package:trashtrack/screens/sign_up/sign_up_screen.dart';

class GoogleSignInPage extends StatefulWidget {
  static String routeName = "/google-sign-in";

  const GoogleSignInPage({super.key, required FirebaseAuth auth});

  @override
  _GoogleSignInPageState createState() => _GoogleSignInPageState();
}

class _GoogleSignInPageState extends State<GoogleSignInPage> {
  final googleSignInProvider = GoogleSignInProvider();

  Future<void> _handleGoogleSignIn() async {
    try {
      final result = await googleSignInProvider.signInWithGoogle(context);
      if (result) {
        // Successfully signed in with Google, navigate to LoginSuccessScreen
        Navigator.pushNamedAndRemoveUntil(context, LoginSuccessScreen.routeName, (route) => false);
      }
    } catch (error) {
      print(error.toString()); // Log any errors
      // Handle errors (e.g., show a snackbar)
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Google Sign In"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: _handleGoogleSignIn,
          child: const Text('Sign in with Google'),
        ),
      ),
    );
  }
}
