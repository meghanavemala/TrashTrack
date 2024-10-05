// ignore_for_file: unused_import, avoid_print
import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';

class BluetoothService {
  BluetoothConnection? connection;
  int receivedInteger = 0;
  bool isConnecting = true;
  bool isDisconnecting = false;
  String _messageBuffer = '';

  final StreamController<int> _integerStreamController =
      StreamController<int>.broadcast();
  Stream<int> get integerStream => _integerStreamController.stream;

  void connect(String address) {
    BluetoothConnection.toAddress(address).then((connection) {
      print('Connected to the device');
      connection = connection;
      isConnecting = false;
      isDisconnecting = false;

      connection.input!.listen(_onDataReceived).onDone(() {
        if (isDisconnecting) {
          print('Disconnecting locally!');
        } else {
          print('Disconnected remotely!');
        }
      });
    }).catchError((error) {
      print('Cannot connect, exception occurred\n\n\n\n');
      print(error+"\n\n\n\n\n");
    });
  }

  void disconnect() {
    if (connection?.isConnected ?? false) {
      isDisconnecting = true;
      connection?.dispose();
      connection = null;
    }
  }

  void _onDataReceived(Uint8List data) {
    int backspacesCounter = 0;
    for (var byte in data) {
      if (byte == 8 || byte == 127) {
        backspacesCounter++;
      }
    }
    Uint8List buffer = Uint8List(data.length - backspacesCounter);
    int bufferIndex = buffer.length;

    backspacesCounter = 0;
    for (int i = data.length - 1; i >= 0; i--) {
      if (data[i] == 8 || data[i] == 127) {
        backspacesCounter++;
      } else {
        if (backspacesCounter > 0) {
          backspacesCounter--;
        } else {
          buffer[--bufferIndex] = data[i];
        }
      }
    }

    String dataString = String.fromCharCodes(buffer);
    int index = buffer.indexOf(13);
    if (~index != 0) {
      String messageText = backspacesCounter > 0
          ? _messageBuffer.substring(
              0, _messageBuffer.length - backspacesCounter)
          : _messageBuffer + dataString.substring(0, index);

      // Update the integer variable if possible
      try {
        receivedInteger = int.parse(messageText);
        print("Received integer: $receivedInteger\n\n\n\n\n");
        _integerStreamController.add(receivedInteger);
      } catch (e) {
        print("Error parsing integer: $e");
      }

      _messageBuffer = dataString.substring(index);
    } else {
      _messageBuffer = (backspacesCounter > 0
          ? _messageBuffer.substring(
              0, _messageBuffer.length - backspacesCounter)
          : _messageBuffer + dataString);
    }
  }

  void dispose() {
    disconnect();
    _integerStreamController.close();
  }
}

final bluetoothService = BluetoothService();
