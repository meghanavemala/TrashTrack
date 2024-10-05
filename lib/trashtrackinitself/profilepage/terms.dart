import 'package:flutter/material.dart';

class Terms extends StatelessWidget {
  const Terms({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Terms And Conditions'),
      ),
      body: const Center(
        child: Text('This is the terms and conditions page'),
      ),
    );
  }
}
