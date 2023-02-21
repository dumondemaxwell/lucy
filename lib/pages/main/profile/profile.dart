import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lucy/components/accordion.dart';
import 'package:lucy/components/full_width_button.dart';
import 'package:lucy/pages/main/profile/sections/advanced_options.dart';
import 'package:lucy/pages/main/profile/sections/basic_options.dart';
import 'package:lucy/pages/main/profile/sections/pet_options.dart';

class Profile extends StatefulWidget {
  Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  CollectionReference userData =
      FirebaseFirestore.instance.collection('userData');

  final FirebaseAuth _authInstance = FirebaseAuth.instance;

  XFile? _selectedImage;
  final ImagePicker picker = ImagePicker();

  _ProfileState() {}

  void _onProfilePicturePressed() async {
    var image = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _selectedImage = image;
    });
  }

  Widget _getProfilePicture() {
    return Padding(
        padding: const EdgeInsets.all(8),
        child: ElevatedButton(
          onPressed: _onProfilePicturePressed,
          style: ElevatedButton.styleFrom(
            shape: const CircleBorder(),
            padding: const EdgeInsets.all(50),
            backgroundColor: Colors.blue, // <-- Button color
            foregroundColor: Colors.red, // <-- Splash color
          ),
          child: const Icon(Icons.person, color: Colors.white),
        ));
  }

  Widget _getEmail() {
    return Padding(
        padding: const EdgeInsets.all(8),
        child: Text(_authInstance.currentUser!.email as String));
  }

  Widget _changePassword() {
    return Padding(
        padding: const EdgeInsets.all(8),
        child: TextFormField(
            decoration: const InputDecoration(labelText: 'Change Password')));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BasicOptionsSection(),
        PetOptionsSection(),
        AdvancedOptionsSection()
      ],
    );
  }
}
