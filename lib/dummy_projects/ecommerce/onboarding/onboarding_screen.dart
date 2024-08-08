import 'package:flutter/material.dart';
import 'package:rwad_two/dummy_projects/ecommerce/auth/auth_screen.dart';
import 'package:rwad_two/dummy_projects/ecommerce/onboarding/onboarding_model.dart';

import '../../../const.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int index = 0;
  void _onTap() {
    if (index < onBoardingList.length - 1) {
      index++;
      setState(() {});
    } else {
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => AuthScreen(),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          top: 143.0,
          left: 20,
          right: 20,
        ),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: 300,
                width: 300,
                child: Image.asset(imagePath + onBoardingList[index].image!),
              ),
              Column(
                children: [
                  Text(
                    onBoardingList[index].title!,
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    onBoardingList[index].description!,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              GestureDetector(
                  onTap: _onTap,
                  child: Container(
                      height: 80,
                      child:
                          Image.asset(imagePath + onBoardingList[index].next!)))
            ],
          ),
        ),
      ),
    );
  }
}
