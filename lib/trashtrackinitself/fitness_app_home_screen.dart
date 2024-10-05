//import 'package:flutter_bluetooth_serial_example/trashtrackinitself/my_diary/dumping_locations.dart';

// ignore_for_file: library_private_types_in_public_api, unused_import

import 'package:trashtrack/ai_chatbot.dart';

import 'models/tabIcon_data.dart';
import 'my_diary/dumping_locations.dart';
import 'training/training_screen.dart';
import 'package:flutter/material.dart';
import 'bottom_navigation_view/bottom_bar_view.dart';
import 'fitness_app_theme.dart';
import 'my_diary/my_diary_screen.dart';
import 'profilepage/profile.dart';

class FitnessAppHomeScreen extends StatefulWidget {
  const FitnessAppHomeScreen({super.key});
  static String routeName='/fitnessapp';
  @override
  _FitnessAppHomeScreenState createState() => _FitnessAppHomeScreenState();
}

class _FitnessAppHomeScreenState extends State<FitnessAppHomeScreen>
    with TickerProviderStateMixin {
  AnimationController? animationController;

  List<TabIconData> tabIconsList = TabIconData.tabIconsList;

  Widget tabBody = Container(
    color: FitnessAppTheme.background,
  );

  @override
  void initState() {
    for (var tab in tabIconsList) {
      tab.isSelected = false;
    }
    tabIconsList[0].isSelected = true;

    animationController = AnimationController(
        duration: const Duration(milliseconds: 600), vsync: this);
    tabBody = MyDiaryScreen(animationController: animationController);
    super.initState();
  }

  @override
  void dispose() {
    animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: FitnessAppTheme.background,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: FutureBuilder<bool>(
          future: getData(),
          builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
            if (!snapshot.hasData) {
              return const SizedBox();
            } else {
              return Stack(
                children: <Widget>[
                  tabBody,
                  bottomBar(),
                ],
              );
            }
          },
        ),
      ),
    );
  }

  Future<bool> getData() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 200));
    return true;
  }

  Widget bottomBar() {
    return Column(
      children: <Widget>[
        const Expanded(
          child: SizedBox(),
        ),
        BottomBarView(
          tabIconsList: tabIconsList,
          addClick: () {},
          changeIndex: (int index) {
  if (index == 0) {
    animationController?.reverse().then<dynamic>((data) {
      if (!mounted) {
        return;
      }
      setState(() {
        tabBody = MyDiaryScreen(animationController: animationController);
      });
    });
  } else if (index == 2) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const AiChatBot()),
    );
  }
  else if (index == 1) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const DumpingLocations()),
    );
  }
  
  else if (index == 3) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const PersonalProfile()),
    );
  }
},
        ),
      ],
    );
  }
}
