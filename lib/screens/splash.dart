
import 'package:camera_app/screens/login.dart';
import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  initState() {
    super.initState();
    _navigatetologin();
  }

_navigatetologin()async{
  await Future.delayed(Duration(milliseconds: 2000), (){});
  Navigator.pushReplacement(context, MaterialPageRoute(builder: ((context) => Login())));
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:Image(image: AssetImage('assets/birdie_logo.png')),
      ),
    );
  }
}