import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class FirebaseNotifications extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Camera App'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: sendNotification,
          child: Text('Send Notification'),
        ),
      ),
    );
  }

  void sendNotification() async {
    final String serverToken = 'YOUR_SERVER_KEY_HERE'; // Replace with your FCM server key
    final String targetToken = 'TARGET_DEVICE_FCM_TOKEN'; // Replace with the target device's FCM token

    await http.post(
      Uri.parse('https://fcm.googleapis.com/fcm/send'),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization': 'key=$serverToken',
      },
      body: constructFCMPayload(targetToken),
    );
  }

  String constructFCMPayload(String token) {
    return '''
    {
      "to": "$token",
      "notification": {
        "title": "Camera Alert",
        "body": "A new video has been uploaded!"
      }
    }
    ''';
  }
}
