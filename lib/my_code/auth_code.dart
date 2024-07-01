import 'dart:typed_data';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Authcode {
  // var for get data and save it in firebase
  // _auth -> the succes login and user data
  final FirebaseAuth _auth = FirebaseAuth.instance;
  //? -> wait for results
  SignInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;
    final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken, idToken: googleAuth?.idToken);
    UserCredential userCredential =
        await _auth.signInWithCredential(credential);
  }

//   SignupWithemailAndpassword(String name,String email , String password) async {
//     try {
//       UserCredential userCredential = await FirebaseAuth.instance
//           .createUserWithEmailAndPassword(
//               email: email,
//               password: password);
//     } on FirebaseAuthException catch (e) {
//       if (e.code == 'weak-password') {
//         print('The password provided is too weak.');
//       } else if (e.code == 'email-already-in-use') {
//         print('The account already exists for that email.');
//       }
//     } catch (e) {
//       print(e);
//     }
//   }
}



// ---------------------------------------------------------------------------------------------------------
// // Future signup() async {
//     // showDialog(context: context,
//     //  barrierDismissible: false,
//     //  builder: (context) => Center(child: CircularProgressIndicator));
//     // try {
//     //   await FirebaseAuth.instance.createUserWithEmailAndPassword(
//     //       email: emailController.text.trim(),
//     //       password: passwordController.text.trim());
//     // } on FirebaseAuthException catch (e) {
//     //   print(e);
//     // }

//     //     try {
//     //     UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
//     //       username:usernameController.text.trim(),
//     //       email: emailController.text.trim(),
//     //       password: passwordController.text.trim()
//     //     );
//     //   } on FirebaseAuthException catch (e) {
//     //     if (e.code == 'weak-password') {
//     //       print('The password provided is too weak.');
//     //     } else if (e.code == 'email-already-in-use') {
//     //       print('The account already exists for that email.');
//     //     }
//     //   } catch (e) {
//     //     print(e);
//     //   }

//     // }

//     // Sign up with email, password, and username
//     Future<User?> signUpWithEmailAndPassword(
//         String username, String email, String password) async {
//       try {
//         UserCredential userCredential =
//             await _auth.createUserWithEmailAndPassword(
//           email: email,
//           password: password,
//         );

//         // Update user profile with username
//         await userCredential.user!.updateDisplayName(username);

//         return userCredential.user;
//       } catch (e) {
//         print('Error signing up: $e');
//         return null;
//       }
//     }
//   // }

//   signin() async {
//     try {
//       UserCredential userCredential = await FirebaseAuth.instance
//           .signInWithEmailAndPassword(
//               email: emailController.text.trim(),
//               password: passwordController.text.trim());
//     } on FirebaseAuthException catch (e) {
//       if (e.code == 'user-not-found') {
//         print('No user found for that email.');
//       } else if (e.code == 'wrong-password') {
//         print('Wrong password provided for that user.');
//       }
//     }
//   }

// class Authcode {
//   static signupUser(String email, String password,String username)async{
//     try{
//       UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
//     }
//   }
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//   //sign up user
//   Future<String> singUpUser({
//     required String email,
//     required String password,
//     required String username,
    
//   }) async {
//     String res = "some error accurred";
//     try {
//       if (email.isNotEmpty || password.isNotEmpty || username.isNotEmpty) {
//         //register user
//         UserCredential cred = await _auth.createUserWithEmailAndPassword(
//             email: email, password: password);
//         //add user to our database
//         await _firestore.collection('users').doc(cred.user!.uid).set({
//           'username': username,
//           'eamil': email,
//         });
//         res = "success";
//         //  print(cred.user.displayName);
//       }
//     } catch (err) {
//       res = err.toString();
//     }
//     return res;
//   }
// }

