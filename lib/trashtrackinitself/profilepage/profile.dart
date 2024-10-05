import 'package:flutter/material.dart';
import 'about_us.dart';
import 'qr.dart';
import 'terms.dart';

class PersonalProfile extends StatelessWidget {
  const PersonalProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF313e87),
        title: const Text(
          "Personal Profile",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
            fontSize: 25,
            color: Color(0xFFf1f3f8),
          ),
        ),
      ),
      body: SingleChildScrollView( // Wrap with SingleChildScrollView
        child: Padding(
          padding: const EdgeInsets.all(40),
          child: Column(
            children: [
              const CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/logo.jpg'), // Change to AssetImage if the photo.jpg is inside the lib folder
              ),
              const SizedBox(height: 80),
              Container(
                decoration: const BoxDecoration(color: Color.fromRGBO(49, 62, 135, 1)),
              ),
              const ListTile(
                title: Text('Name'),
                subtitle: Text('Timma Raaju'),
                leading: Icon(Icons.person, size: 26, color: Color(0xFF313e87)),
                tileColor: Color(0xFFf1f3f8),
              ),
              const SizedBox(height: 40),
              ListTile(
                title: const Text('QR Code'),
                subtitle: const Text('Access your QR code'),
                leading: const Icon(Icons.qr_code_2_outlined, size: 26, color: Color(0xFF313e87)),
                trailing: const Icon(Icons.arrow_forward, color: Color(0xFF313e87)),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const QR()),
                  );
                },
                tileColor: const Color(0xFFf1f3f8),
              ),
              const SizedBox(height: 40),
              ListTile(
                title: const Text('Terms And Conditions'),
                subtitle: const Text('Click to read'),
                leading: const Icon(Icons.info_outline_rounded, size: 26, color: Color(0xFF313e87)),
                trailing: const Icon(Icons.arrow_forward, color: Color(0xFF313e87)),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Terms()),
                  );
                },
                tileColor: const Color(0xFFf1f3f8),
              ),
              const SizedBox(height: 40),
              ListTile(
                title: const Text('About Us'),
                subtitle: const Text('Cryptic Something'),
                leading: const Icon(Icons.people_sharp, size: 26, color: Color(0xFF313e87)),
                trailing: const Icon(Icons.arrow_forward, color: Color(0xFF313e87)),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const AboutUs()),
                  );
                },
                tileColor: const Color(0xFFf1f3f8),
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
