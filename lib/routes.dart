// lib/routes.dart
// ignore_for_file: unused_import

import 'package:flutter/widgets.dart';
import 'package:trashtrack/ai_chatbot.dart';
//import 'package:trashtrack/best_page.dart';
import 'package:trashtrack/qr_create.dart';
import 'package:trashtrack/trashtrackinitself/fitness_app_home_screen.dart';
import 'package:trashtrack/trashtrackinitself/my_diary/my_diary_screen.dart';
import 'screens/forgot_password/forgot_password_screen.dart';
import 'screens/init_screen.dart'; // Correct import path for HelloPage
import 'screens/login_success/login_success_screen.dart';
import 'screens/otp/otp_screen.dart';
import 'screens/sign_in/sign_in_screen.dart';
import 'screens/sign_up/sign_up_screen.dart';
import 'introduction_animation/introduction_animation_screen.dart';
import 'screens/email_otp/email_otp_screen.dart';
import 'auth_check.dart'; // Import the AuthCheck screen

// We use name route
// All our routes will be available here
final Map<String, WidgetBuilder> routes = {
  HelloPage.routeName: (context) => const HelloPage(),
  AuthCheck.routeName: (context) => const AuthCheck(),
  IntroductionAnimationScreen.routeName: (context) => const IntroductionAnimationScreen(),
  SignInScreen.routeName: (context) => SignInScreen(),
  ForgotPasswordScreen.routeName: (context) => const ForgotPasswordScreen(),
  LoginSuccessScreen.routeName: (context) => LoginSuccessScreen(),
  SignUpScreen.routeName: (context) => SignUpScreen(),
  OtpScreen.routeName: (context) => const OtpScreen(),
  EmailOtpScreen.routeName: (context) => const EmailOtpScreen(),
  DisplayQRCode.routeName:(context) => const DisplayQRCode(),
  AiChatBot.routeName:(context) => const AiChatBot(),
  //YourPreviousPage.routeName:(context) => const YourPreviousPage(),
  FitnessAppHomeScreen.routeName:(context) => const FitnessAppHomeScreen(),
  //const MyDiaryScreen().routeName:(context) => const MyDiaryScreen(),
};

