//import '/design_course/home_design_course.dart';
import '/trashtrackinitself/fitness_app_home_screen.dart';
//import '/hotel_booking/hotel_home_screen.dart';
//import '/introduction_animation/introduction_animation_screen.dart';
import 'package:flutter/widgets.dart';

class HomeList {
  HomeList({
    this.navigateScreen,
    this.imagePath = '',
  });

  Widget? navigateScreen;
  String imagePath;

  static List<HomeList> homeList = [
    HomeList(
      imagePath: 'assets/fitness_app/fitness_app.png',
      navigateScreen: const FitnessAppHomeScreen(),
    ),
    
  ];
}