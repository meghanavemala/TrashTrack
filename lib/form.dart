// ignore_for_file: avoid_print, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AiForm extends StatefulWidget {
  const AiForm({super.key});
  static String routeName = "/ai_chatbot";

  @override
  State<AiForm> createState() => _AiFormState();
}

class _AiFormState extends State<AiForm> {
  Future<void> _launchChatbotApp() async {
    String urlString = 'https://forms.gle/EkyJcukC6ca8riWcA';

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
        title: const Text('Absence form'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: _launchChatbotApp,
          child: const Text('Launch form'),
        ),
      ),
    );
  }
}


