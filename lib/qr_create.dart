import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:qr_flutter/qr_flutter.dart';

class DisplayQRCode extends StatelessWidget {
  const DisplayQRCode({Key? key}) : super(key: key);
  static String routeName = "/qr_display";
  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;
    String uid = user != null ? user.uid : '1nuPFxBvHWZOJ6i1SBHSBFUvv8S2';

    return Scaffold(
      appBar: AppBar(title: const Text('Display QR Code')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            QrImageView(
              data: uid,
              size: 200,
            ),
            const SizedBox(height: 20),
            Text(
              'UID: $uid',
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
