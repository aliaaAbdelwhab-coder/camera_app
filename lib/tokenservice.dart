import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class TokenService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> saveToken(String? token) async {
    if (token != null) {
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        await _firestore.collection('users').doc(user.uid).set({
          'token': token,
        }, SetOptions(merge: true));
      }
    }
  }
}
