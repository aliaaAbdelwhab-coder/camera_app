// This is a basic Flutter widget test.

// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:camera_app/main.dart';
void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(BirdieApp());

    // Verify that our counter starts at 0.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });
}


// import 'package:flutter/material.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:camera/camera.dart';
// import 'package:camera_app/main.dart';

// void main() {
//   testWidgets('CameraApp smoke test', (WidgetTester tester) async {
//     // Mock camera description for testing
//     final cameras = await availableCameras();
//     final firstCamera = cameras.first;

//     // Build our app and trigger a frame.
//     await tester.pumpWidget(CameraApp(camera: firstCamera));

//     // Verify that our camera preview is displayed
//     expect(find.byType(CameraPreview), findsOneWidget);

//     // Tap the capture button and verify the frame is sent
//     await tester.tap(find.byIcon(Icons.camera));
//     await tester.pump();

//     // You can add more checks to verify the expected behavior
//   });
// }
