import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rwad_two/dummy_projects/ecommerce/auth/auth_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Color _color = Color(0xFF40AA54);
  int imageNum = 1;

  void _changeSplash() {
    if (imageNum == 1) {
      _color = Colors.white;
      imageNum = 2;
    } else {
      _color = Color(0xFF40AA54);
      imageNum = 1;
    }

    print("Change Splash");
    setState(() {});
  }

  @override
  void initState() {
    const oneSec = Duration(seconds: 1);
    var time = Timer.periodic(oneSec, (Timer t) => _changeSplash());

    Future.delayed(Duration(seconds: 2)).then(
      (val) {
        time.cancel();
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => AuthScreen(),
        ));
      },
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _color,
      body: Center(
        child: Container(
            height: 300,
            width: 300,
            child: Image.asset("assets/images/logo$imageNum.png")),
      ),
    );
  }
}
