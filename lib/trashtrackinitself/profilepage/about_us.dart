// ignore_for_file: non_constant_identifier_names, avoid_print, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({super.key});
  static String routeName = "/ai_chatbot";

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  Future<void> _AboutUspage() async {
    String urlString = 'https://anthahkarana.live/cryptic-something';
    Uri url = Uri.parse(urlString);

    print('Launching URL: $url'); // Added print statement

    try {
      await launchUrl(url);
    } catch (e) {
      print(e.toString()); // Print error message
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('An error occurred while launching the website'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile Page'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: _AboutUspage,
          child: const Text('About Us'),
        ),
      ),
    );
  }
}
