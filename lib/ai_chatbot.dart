// ignore_for_file: avoid_print, use_build_context_synchronously


//import 'package:webview_flutter/webview_flutter.dart';

/*class AiChatBot extends StatefulWidget {
  const AiChatBot({super.key});

  @override
  State<AiChatBot> createState() => _AiChatBotState();
}

class _AiChatBotState extends State<AiChatBot> {
  late final WebViewController _controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Resunoo AI'),
      ),
      body: Stack(
        children: [
          WebView(
            onWebViewCreated: (controller) => _controller = controller,
            initialUrl: 'https://resunoo.vercel.app',
          ),
          Positioned(
            bottom: 20.0,
            right: 20.0,
            child: FloatingActionButton(
              onPressed: () async {
                if (_controller != null) {
                  final url = await _controller.currentUrl();
                  print("Current URL: $url");
                } else {
                  print("Web view controller not initialized yet.");
                }
              },
              child: const Icon(Icons.info),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}*/

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AiChatBot extends StatefulWidget {
  const AiChatBot({super.key});
  static String routeName = "/ai_chatbot";

  @override
  State<AiChatBot> createState() => _AiChatBotState();
}

class _AiChatBotState extends State<AiChatBot> {
  Future<void> _launchChatbotApp() async {
    String urlString = 'https://trashtrack.streamlit.app';
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
        title: const Text('Resunoo AI'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: _launchChatbotApp,
          child: const Text('Launch Chatbot'),
        ),
      ),
    );
  }
}


