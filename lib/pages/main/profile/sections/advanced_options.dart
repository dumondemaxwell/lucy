import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lucy/components/accordion.dart';
import 'package:lucy/components/full_width_button.dart';
import 'package:lucy/pages/auth/splash.dart';

class AdvancedOptionsSection extends StatelessWidget {
  final FirebaseAuth _authInstance = FirebaseAuth.instance;
  AdvancedOptionsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Accordion(
        isOpen: false,
        title: "Advanced Options",
        content: Center(child: Column(
          children: [
            FullWidthButton(
                child: const Text("Logout"),
                onPressed: () async {
                  await _authInstance.signOut();
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (context) => Splash()),
                          (Route<dynamic> route) => false);
                })
          ],
        )));
  }
}
