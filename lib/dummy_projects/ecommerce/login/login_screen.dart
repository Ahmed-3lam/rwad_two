import 'package:flutter/material.dart';
import 'package:rwad_two/const.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          top: 100.0,
          left: 20,
          right: 20,
        ),
        child: Center(
          child: Column(
            children: [
              Container(
                width: width * .8,
                child: Image.asset(
                  imagePath + "logo2.png",
                ),
              ),
              SizedBox(
                height: height * .2,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _customTextField(height, "Email"),
                  SizedBox(
                    height: height * .02,
                  ),
                  _customTextField(height, "Password"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _customTextField(
    double height,
    String text,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: TextStyle(color: Color(0xFF8B8B97)),
        ),
        SizedBox(
          height: height * .01,
        ),
        TextFormField(),
      ],
    );
  }
}
