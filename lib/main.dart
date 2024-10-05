// lib/main.dart
// ignore_for_file: unused_element, avoid_print

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart';
import 'package:firebase_core/firebase_core.dart';
import 'routes.dart';
import 'theme.dart';
import 'auth_check.dart'; // Import the AuthCheck screen
import '/bluetooth_connect/bl.dart';
import 'package:permission_handler/permission_handler.dart';

import 'trashtrackinitself/models/meals_list_data.dart';

/*void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); // Initialize Firebase
  await SystemChrome.setPreferredOrientations(<DeviceOrientation>[
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]).then((_) {
    // Start Bluetooth service and listen for updates when the app starts
    bluetoothService.connect('98:DA:50:02:70:7A');
    MealsListData.startListening();

    runApp(const MyApp());
  });
}

*/
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); // Initialize Firebase
  await SystemChrome.setPreferredOrientations(<DeviceOrientation>[
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]);

  // Request Bluetooth permission before starting services
  await _requestBluetoothPermissions();

  // Start Bluetooth service and listen for updates only if permission granted
  if (await Permission.bluetooth.isGranted) {
    bluetoothService.connect('98:DA:50:02:70:7A');
    MealsListData.startListening();
  } else {
    // Handle the case where permission is denied
    print("Bluetooth permission denied!");
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness:
          !kIsWeb && Platform.isAndroid ? Brightness.dark : Brightness.light,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarDividerColor: Colors.transparent,
      systemNavigationBarIconBrightness: Brightness.dark,
    ));

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cryptic Something',
      theme: AppTheme.lightTheme(context),
      initialRoute: AuthCheck.routeName, // Set the initial route to AuthCheck
      routes: routes,
    );
  }
}
Future<void> _requestBluetoothPermissions() async {
  if (Platform.isAndroid || Platform.isIOS) {
    // Request permission to access Bluetooth
    var status = await Permission.bluetooth.request();
    if (!status.isGranted) {
      // Handle denied or restricted permissions
      if (status.isDenied) {
        // Permissions are denied, show a message or dialog to the user
      } else if (status.isRestricted) {
        // Permissions are restricted, show a message or dialog to the user
      }
    }
  }
}

class HexColor extends Color {
  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));

  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF$hexColor';
    }
    return int.parse(hexColor, radix: 16);
  }
}


/*void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); // Initialize Firebase
  await SystemChrome.setPreferredOrientations(<DeviceOrientation>[
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]).then((_) => runApp(const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness:
          !kIsWeb && Platform.isAndroid ? Brightness.dark : Brightness.light,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarDividerColor: Colors.transparent,
      systemNavigationBarIconBrightness: Brightness.dark,
    ));

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cryptic Something',
      theme: AppTheme.lightTheme(context),
      initialRoute: AuthCheck.routeName, // Set the initial route to AuthCheck
      routes: routes,
    );
  }
}

class HexColor extends Color {
  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));

  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF$hexColor';
    }
    return int.parse(hexColor, radix: 16);
  }
}
*/