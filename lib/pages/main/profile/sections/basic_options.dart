import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lucy/components/accordion.dart';

class BasicOptionsSection extends StatefulWidget {
  const BasicOptionsSection({super.key});

  @override
  State<BasicOptionsSection> createState() => _BasicOptionsSectionState();
}

class _BasicOptionsSectionState extends State<BasicOptionsSection> {
  final FirebaseAuth _authInstance = FirebaseAuth.instance;

  _getUsername(){
    return _authInstance.currentUser?.displayName ?? "";
  }

  _getEmail(){
    var user = _authInstance.currentUser;
    if(user?.providerData.isNotEmpty ?? false){
      return user!.providerData[0].email;
    }

    return 'No Email';
  }

  @override
  Widget build(BuildContext context) {
    print(_authInstance.currentUser);
    return Accordion(
        isOpen: true,
        title: "Profile",
        content: Center(
            child: Column(
          children: [
            Padding(
                padding: const EdgeInsets.all(8),
            child: Row(
              children: [
                const Text("Username",
                    style: TextStyle(fontWeight: FontWeight.bold)),
                const Spacer(),
                Text(_getUsername())
              ],
            )),
            Padding(padding: const EdgeInsets.all(8),
            child:             Row(
              children: [
                const Text("Email",
                    style: TextStyle(fontWeight: FontWeight.bold)),
                const Spacer(),
                Text(_getEmail())
              ],
            ))
          ],
        )));
  }
}
