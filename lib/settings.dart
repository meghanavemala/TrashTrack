// ignore_for_file: avoid_print, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  late String _uid;
  late String _username;
  late String _phoneNumber;
  late String _emailId;

  @override
  void initState() {
    super.initState();
    _getUserData();
  }

  Future<void> _getUserData() async {
    final user = _auth.currentUser;
    if (user != null) {
      setState(() {
        _uid = user.uid;
      });
      final docSnapshot = await _firestore.collection('user_data').doc(_uid).get();
      if (docSnapshot.exists) {
        setState(() {
          _username = docSnapshot['username'];
          print("\n\n\n\n\n\n\n");
          print(_uid);
          print(_username);
          _phoneNumber = docSnapshot['ph'];
          print(_phoneNumber);
          _emailId = docSnapshot['email'];
        });
      } else {
        setState(() {
          _username = 'empty';
          _phoneNumber = 'empty';
          _emailId = 'empty';
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Username',
              style: TextStyle(fontSize: 16.0),
            ),
            Text(_username),
            const SizedBox(height: 20.0),
            const Text(
              'Phone Number',
              style: TextStyle(fontSize: 16.0),
            ),
            Text(_phoneNumber),
            const SizedBox(height: 20.0),
            const Text(
              'Email ID',
              style: TextStyle(fontSize: 16.0),
            ),
            Text(_emailId),
            const SizedBox(height: 20.0),
          ],
        ),
      ),
    );
  }
}