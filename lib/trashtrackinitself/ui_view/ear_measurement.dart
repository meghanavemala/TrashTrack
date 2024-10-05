// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class BodyMeasurementView extends StatelessWidget {
  static const String _imagePath = 'assets/fitness_app/news.png';
  static const String _url = 'https://www.thehindu.com/news/cities/Kochi/maradu-municipality-enhances-infrastructure-for-waste-management/article68713634.ece'; // Replace with your URL

  const BodyMeasurementView({super.key});

  Future<void> _launchURL() async {
    if (await canLaunch(_url)) {
      await launch(_url);
    } else {
      throw 'Could not launch $_url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24, right: 24, top: 16, bottom: 18),
      child: GestureDetector(
        onTap: _launchURL,
        child: Image.asset(
          _imagePath,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
