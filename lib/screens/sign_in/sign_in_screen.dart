// ignore_for_file: unused_local_variable, use_build_context_synchronously, avoid_print

/*import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:trashtrack/screens/sign_up/sign_up_screen.dart';

import '../../components/no_account_text.dart';
import '../../components/socal_card.dart';
import '../login_success/login_success_screen.dart';

class SignInScreen extends StatelessWidget {
  static String routeName = "/sign_in";

 SignInScreen({super.key});
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final googleSignIn = SignInWithGoogle(); // Create an instance

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign In"),
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
                  const Text(
                    "Welcome Back",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    "Sign in with your email and password  \nor continue with social media",
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  SignForm( // Pass FirebaseAuth instance and GoogleSignIn instance
                    auth: _auth,
                    googleSignIn: googleSignIn,
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SocalCard(
                        icon: "assets/icons/google-icon.svg",
                        press: () async {
                          // Sign In with Google (placeholder for now)
                          final GoogleSignInAccount? account = await googleSignIn.signIn();
                          // Handle the returned GoogleSignInAccount object
                          if (account != null) {
                            // Implement logic to handle Google Sign In with Firebase (placeholder for error handling)
                            print('Google Sign In successful (placeholder).');
                            // ... (use account information for further authentication)
                          }
                        },
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
                  const SizedBox(height: 20),
                  const NoAccountText(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class SignForm extends StatefulWidget {
  final FirebaseAuth auth;
  final SignInWithGoogle googleSignIn;

  const SignForm({super.key, required this.auth, required this.googleSignIn});

  @override
  State<SignForm> createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  final _formKey = GlobalKey<FormState>();
  String? email;
  String? password;

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

  Future<void> _signInWithEmailAndPassword() async {
    try {
      final UserCredential userCredential = await widget.auth
          .signInWithEmailAndPassword(email: email!, password: password!);
      // Navigate to your home screen after successful login (replace with your actual route name)
      Navigator.pushReplacementNamed(context, LoginSuccessScreen.routeName);
    } on FirebaseAuthException catch (e) {
      if (e.message != null) {
        _showErrorDialog(e.message!);
      } else {
        _showErrorDialog("An error occurred during login. Please try again.");
      }
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
            onPressed: _signInWithEmailAndPassword,
            child: const Text('Login'),
          ),
        ],
      ),
    );
  }
}*/

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
//import 'package:google_sign_in/google_sign_in.dart';
import 'package:trashtrack/screens/sign_in/google_signin.dart';
import 'package:trashtrack/screens/sign_up/sign_up_screen.dart';

import '../../components/no_account_text.dart';
import '../../components/socal_card.dart';
import '../login_success/login_success_screen.dart';

class SignInScreen extends StatelessWidget {
  static String routeName = "/sign_in";

  SignInScreen({super.key});
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final googleSignIn = SignInWithGoogle(); // Create an instance

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign In"),
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
                  const Text(
                    "Welcome Back",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    "Sign in with your email and password  \nor continue with social media",
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  SignForm(auth: _auth, googleSignIn: googleSignIn),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SocalCard(
                        icon: "assets/icons/google-icon.svg",
                        press: () async {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => GoogleSignInPage(auth: _auth),
                            ),
                          );
                        }
                      ),
                      SocalCard(
                        icon: "assets/icons/facebook-2.svg",
                        press: () {}, // Implement Facebook Sign In (if needed)
                      ),
                      SocalCard(
                        icon: "assets/icons/twitter.svg",
                        press: () {}, // Implement Twitter Sign In (if needed)
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const NoAccountText(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  /*void _showErrorDialog(BuildContext context, String message) {
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
  }*/
}

class SignForm extends StatefulWidget {
  final FirebaseAuth auth;
  final SignInWithGoogle googleSignIn;

  const SignForm({super.key, required this.auth, required this.googleSignIn});

  @override
  State<SignForm> createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  final _formKey = GlobalKey<FormState>();
  String? email;
  String? password;

  void _showErrorDialog(BuildContext context, String message) {
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

  Future<void> _signInWithEmailAndPassword() async {
    try {
      final UserCredential userCredential = await widget.auth
          .signInWithEmailAndPassword(email: email!, password: password!);
      // Navigate to your home screen after successful login (replace with your actual route name)
      Navigator.pushReplacementNamed(context, LoginSuccessScreen.routeName);
    } on FirebaseAuthException catch (e) {
      if (e.message != null) {
        _showErrorDialog(context, e.message!);
      } else {
        _showErrorDialog(context, "An error occurred during login. Please try again.");
      }
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
                await _signInWithEmailAndPassword();
              }
            },
            child: const Text('Login'),
          ),
        ],
      ),
    );
  }
}
