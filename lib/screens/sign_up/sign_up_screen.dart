// ignore_for_file: library_private_types_in_public_api, avoid_print, unused_local_variable, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:trashtrack/screens/login_success/login_success_screen.dart';
import '../../components/socal_card.dart';
//import '../../constants.dart';
// Import the firebase_auth package
import 'package:firebase_auth/firebase_auth.dart';
//import 'components/login_form.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
//import '../login_success/login_success_screen.dart';

class SignUpScreen extends StatelessWidget { // Renamed LoginPage to SignUpScreen
  static String routeName = "/login"; // Update route name if needed
  SignUpScreen({super.key});
  final googleSignIn = SignInWithGoogle();
  final googleSignInProvider = GoogleSignInProvider();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"), // Update title if needed for SignUp
      ),
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 16),
                  //const Text("Welcome Back", style: headingStyle),
                  const Text(
                    "Login to manage\nyour trash effectively",
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  const LoginForm(),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SocalCard(
                        icon: "assets/icons/google-icon.svg",
                        press: () => googleSignInProvider.signInWithGoogle(context),
                      ),
                      SocalCard(
                        icon: "assets/icons/facebook-2.svg",
                        press: () {},
                      ),
                      SocalCard(
                        icon: "assets/icons/twitter.svg",
                        press: () {},
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Text.rich(
                    TextSpan(
                      text:
                          'By continuing, you confirm that you agree\nwith our ',
                      style: Theme.of(context).textTheme.bodySmall,
                      children: [
                        TextSpan(
                          text: 'Terms and Conditions',
                          style: const TextStyle(
                            color: Colors.blue, // Change color to blue
                            decoration:
                                TextDecoration.underline, // Add underline
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              _launchUrl(
                                  'https://www.youtube.com/watch?v=Z_MvkyuOJgk'); // Call _launchUrl function
                            },
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

void _launchUrl(String url) async {
  if (await canLaunchUrl(url as Uri)) {
    await launchUrl(url as Uri);
  } else {
    throw 'Could not launch $url';
  }
}


// Create a new Login Form widget
class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  String? email;
  String? password;
  final authService = AuthService();

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Error"),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Ok"),
            ),
          ],
        );
      },
    );
  }

  /*Future<void> _signInWithEmailAndPassword() async {
    final auth = FirebaseAuth.instance; // Moved here for LoginForm access
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      try {
        final userCredential = await auth.signInWithEmailAndPassword(
            email: email!, password: password!);
        // Navigate to your home screen after successful login
        Navigator.pushNamed(context, LoginSuccessScreen.routeName); // Replace with your home screen route name
      } on FirebaseAuthException catch (e) {
        _showErrorDialog(e.message!);
      }
    }
  }*/
  Future<void> _registerUser() async {
    try {
      final userCredential = await authService.createUserWithEmailAndPassword(
          email!, password!);
      if (userCredential != null) {
        // User created successfully, navigate to LoginSuccessScreen
        Navigator.pushNamed(context, LoginSuccessScreen.routeName);
      }
    } on FirebaseAuthException catch (e) {
      // Handle specific Firebase Authentication errors
      if (e.code == 'weak-password') {
        _showErrorDialog("The password provided is too weak.");
      } else if (e.code == 'email-already-in-use') {
        _showErrorDialog("The account already exists for that email.");
      } else {
        _showErrorDialog("Registration failed!"); // Generic message for other errors
      }
    } catch (e) {
      // Handle other exceptions (e.g., network errors)
      print(e.toString()); // Log the error for debugging
      _showErrorDialog("An unexpected error occurred. Please try again.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
              labelText: "Email",
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter your email.';
              }
              return null;
            },
            onSaved: (newValue) => email = newValue,
          ),
          const SizedBox(height: 16),
          TextFormField(
            obscureText: true,
            decoration: const InputDecoration(
              labelText: "Password",
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter your password.';
              }
              return null;
            },
            onSaved: (newValue) => password = newValue,
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () async {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                // Attempt to register the user
                await _registerUser();
              }
            },
            child: const Text('Register'),
          ),
        ],
      ),
    );
  }
}


class SignInWithGoogle {
  final _googleSignIn = GoogleSignIn();

  Future<GoogleSignInAccount?> signIn() async {
    try {
      final GoogleSignInAccount? account = await _googleSignIn.signIn();
      return account;
    } on PlatformException catch (error) {
      // Handle platform exceptions (e.g., user cancelled sign in)
      if (error.code == 'platform_exception') {
        print(error.message); // Log the error message
      }
      return null;
    }
  }
}

class GoogleSignInProvider extends ChangeNotifier {
  final googleSignIn = GoogleSignIn();

  Future<bool> signInWithGoogle(BuildContext context) async {
    try {
      final GoogleSignInAccount? account = await googleSignIn.signIn();
      if (account != null) {
        // Implement Firebase Authentication with Google credentials (placeholder removed)
        print('Google Sign In successful.');
        // You can now return true to indicate success
        return true; 
      }
      return false; // Return false if sign in fails
    } on PlatformException catch (error) {
      // Handle platform exceptions (e.g., user cancelled sign in)
      if (error.code == 'platform_exception') {
        print(error.message); // Log the error message
      }
      return false; // Return false on errors
    }
  }
}


class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<UserCredential?> createUserWithEmailAndPassword(
      String email, String password) async {
    try {
      final userCredential = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return userCredential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
      return null; // Handle other exceptions as needed
    } catch (e) {
      print(e.toString()); // Log any other errors
      return null;
    }
  }

  Future<UserCredential?> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      final userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return userCredential;
    } on FirebaseAuthException catch (e) {
      print(e.message);
      return null; // Handle other exceptions as needed
    } catch (e) {
      print(e.toString()); // Log any other errors
      return null;
    }
  }
}