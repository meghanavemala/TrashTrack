import 'package:flutter/material.dart';
import 'package:trashtrack/introduction_animation/introduction_animation_screen.dart';

class HelloPage extends StatelessWidget {
  static const String routeName = '/';

  // Add a key parameter to the constructor
  const HelloPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hello Y'),
      ),
      body: Column(
        children: [
          const SizedBox(height: 16),
          const SizedBox(height: 16),
          const Text(
            "Hello there",
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
                Navigator.pushNamed(
                    context, IntroductionAnimationScreen.routeName);
              },
              child: const Text("Lessgoo Back"),
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
