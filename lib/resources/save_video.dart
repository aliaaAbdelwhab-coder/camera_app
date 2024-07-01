import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

final FirebaseStorage _storage = FirebaseStorage.instance;
final FirebaseFirestore _firestore = FirebaseFirestore.instance;
class StoreData {
  Future<String> uploadVideo(String VideoURL) async {
    // Reference ref = _storage.ref().child('Videos/${DataTime.now()}.mp4');
    Reference ref = _storage.ref().child('Videos/${DateTime.now().toIso8601String()}.mp4');
    await ref.putFile(File(VideoURL));
    String downloadURL = await ref.getDownloadURL();
    return downloadURL;
  }

Future<void> saveVideoData(String VideoDownloadUrl) async{
  await _firestore.collection('videos').add({
    'url':VideoDownloadUrl,
    'timeStamp' : FieldValue.serverTimestamp(),
    'name' : 'User Video'
  });
}

}
