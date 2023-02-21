import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CreateUser extends StatefulWidget {
  @override
  State<CreateUser> createState() => _CreateUserState();
}

class _CreateUserState extends State<CreateUser> {
  bool isFarm = false;
  final _firebaseAuth = FirebaseAuth.instance;
  // final _user_profiles = FirebaseFirestore.instance.collection("user_profiles");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("User Info"),
      ),
      body: Center(
          child: Column(
        children: [
          const Padding(
              padding: EdgeInsets.all(8),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Enter Username',
                    hintText: 'Enter Username'),
              )),
          const Padding(
              padding: EdgeInsets.all(8),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Address',
                    hintText: 'Address'),
              )),
          const Padding(
              padding: EdgeInsets.all(8),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'City',
                    hintText: 'City'),
              )),
          const Padding(
              padding: EdgeInsets.all(8),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'State',
                    hintText: 'State'),
              )),
          const Padding(
              padding: EdgeInsets.all(8),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Enter Zip Code',
                    hintText: 'Enter Zip Code'),
              )),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              children: [
                const Text("Operating as Business?",
                    style: TextStyle(fontWeight: FontWeight.bold)),
                const Spacer(),
                Switch(
                  value: isFarm,
                  onChanged: (bool value) {
                    setState(() {
                      isFarm = value;
                    });
                  },
                )
              ],
            ),
          ),
        ],
      )),
    );
  }
}
