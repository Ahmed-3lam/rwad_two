import 'dart:async';

import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  int imageNum = 1;

  _changeImage() {
    if (imageNum == 1) {
      imageNum = 2;
    } else {
      imageNum = 1;
    }

    setState(() {});
  }

  @override
  void initState() {
    const oneSec = Duration(seconds: 1);
    var time = Timer.periodic(oneSec, (Timer t) => _changeImage());

    // Future.delayed(Duration(seconds: 2)).then(
    //       (val) {
    //     time.cancel();
    //     // Navigator.of(context).push(MaterialPageRoute(
    //     //   builder: (context) => AuthScreen(),
    //     // ));
    //   },
    // );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: MediaQuery.sizeOf(context).height,
            child: Image.asset(
              "assets/images/background$imageNum.png",
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                top: 130.0, left: 30, bottom: 20, right: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Welcome to our",
                  style: TextStyle(
                    fontSize: 36,
                    color: Color(0xFF16162E),
                    fontWeight: FontWeight.w800,
                  ),
                ),
                Text(
                  "E-Grocery",
                  style: TextStyle(
                    fontSize: 36,
                    color: Colors.green,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                Spacer(),
                Container(
                  height: 56,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Center(
                    child: Text(
                      "Continue with Email or Phone",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 56,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Center(
                    child: Text(
                      "Create an account",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
