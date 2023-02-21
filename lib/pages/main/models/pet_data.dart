import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class PetData {
  final FirebaseAuth _authInstance = FirebaseAuth.instance;

  String petName;
  String nickName;
  String uid;
  double rate;
  List<String> photoPaths;

  PetData(
      {this.uid = '',
      required this.petName,
      required this.nickName,
      required this.rate,
      required this.photoPaths}) {
    if (uid.isEmpty) {
      uid = _authInstance.currentUser?.uid as String;
    }
  }

  Map<String, dynamic> toMap() {
    return {
      'petName': petName,
      'nickName': nickName,
      'uid': uid,
      'rate': rate,
      'photoPaths': photoPaths
    };
  }
}
