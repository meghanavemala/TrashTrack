import 'package:flutter/material.dart';

class DumpingLocations extends StatelessWidget {
  // Define background color
final Color backgroundColor = const Color(0xFFF1F3F8);

  const DumpingLocations({super.key}); // Change the color as needed

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dumping Locations'),
      ),
      body: Container(
        color: backgroundColor,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  'Dumping Locations',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Image.asset('assets/fitness_app/3.png'), // Change path to your image
              const SizedBox(height: 10),
              Image.asset('assets/fitness_app/4.png'), // Change path to your image
              const SizedBox(height: 10),
              Image.asset('assets/fitness_app/5.png'), // Change path to your image
              const SizedBox(height: 10),
              Image.asset('assets/fitness_app/6.png'), // Change path to your image
              const SizedBox(height: 10),
              Image.asset('assets/fitness_app/7.png'), // Change path to your image
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: DumpingLocations(),
  ));
}
