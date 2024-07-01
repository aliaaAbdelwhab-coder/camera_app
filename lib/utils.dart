import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

pickVideo() async {
  final picker = ImagePicker();
  XFile? VideoFile;
  try {
    VideoFile = await picker.pickVideo(source: ImageSource.gallery);
    return VideoFile!.path;
  } catch (e) {
    print('Error picking video :$e');
  }
}
