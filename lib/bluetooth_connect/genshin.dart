// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'bl.dart'; // Import the BluetoothService

class GenshinPage extends StatefulWidget {
  final String serverAddress;

  const GenshinPage({super.key, required this.serverAddress});

  @override
  _GenshinPageState createState() => _GenshinPageState();
}

class _GenshinPageState extends State<GenshinPage> {
  @override
  void initState() {
    super.initState();
    bluetoothService
        .connect(widget.serverAddress); // Connect to the Bluetooth device
  }

  @override
  void dispose() {
    bluetoothService
        .dispose(); // Dispose the BluetoothService when the page is disposed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Genshin Bluetooth Data Receiver'),
      ),
      body: Center(
        child: StreamBuilder<int>(
          stream: bluetoothService.integerStream,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Text(
                'Received Integer: ${snapshot.data}',
                style: const TextStyle(fontSize: 24),
              );
            } else {
              return const Text(
                'Waiting for data...',
                style: TextStyle(fontSize: 24),
              );
            }
          },
        ),
      ),
    );
  }
}
