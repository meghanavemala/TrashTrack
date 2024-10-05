import 'package:flutter/material.dart';

class LegMeasurementView extends StatelessWidget {
  static const String _imagePath = 'assets/fitness_app/7.png';

  const LegMeasurementView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24, right: 24, top: 16, bottom: 18),
      child: Image.asset(
        _imagePath,
        fit: BoxFit.cover,
      ),
    );
  }
}
