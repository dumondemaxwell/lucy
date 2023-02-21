import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  CollectionReference petData = FirebaseFirestore.instance.collection('pets');
  final FirebaseAuth _authInstance = FirebaseAuth.instance;

  _HomeState() {}

  @override
  Widget build(BuildContext context) {
    return Text("Home");
  }
}
