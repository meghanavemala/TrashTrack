import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MiddleButtonBot extends StatelessWidget {
  const MiddleButtonBot({Key? key}) : super(key: key);

  // Function to open URL in browser
_launchURLBrowser() async {
var url = Uri.parse("https://www.geeksforgeeks.org/");
if (await canLaunchUrl(url)) {
	await launchUrl(url);
} else {
	throw 'Could not launch $url';
}
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Abcd'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: _launchURLBrowser, // Open URL when button is pressed
          child: const Text('Opening the link'),
        ),
      ),
    );
  }
}
