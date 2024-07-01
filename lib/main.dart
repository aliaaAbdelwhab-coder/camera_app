import 'dart:io';

import 'package:camera_app/screens/Firebasenotifications.dart';
import 'package:camera_app/screens/createaccount.dart';
import 'package:camera_app/screens/forgetpassword.dart';
import 'package:camera_app/screens/homebage.dart';
import 'package:camera_app/screens/login.dart';
import 'package:camera_app/screens/splash.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:video_player/video_player.dart';
import 'resources/save_video.dart';
import 'utils.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  FirebaseNotifications();
  runApp(BirdieApp());
}

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print('Handling a background message: ${message.messageId}');
}

class BirdieApp extends StatelessWidget {
  const BirdieApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Birdie App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Birdie(),
    );
  }
}

class Birdie extends StatefulWidget {
  const Birdie({super.key});

  @override
  State<Birdie> createState() => _BirdieState();
}

class _BirdieState extends State<Birdie> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(initialRoute: '/', routes: {
      '/': (context) => const Splash(),
      '/login': (context) => const Login(),
      '/createaccount': (context) => const CreateAccount(),
      '/forgetpassword': (context) => const ForgetPasswordpage(),
      '/home': (context) => const Home(),
    });
  }
}
