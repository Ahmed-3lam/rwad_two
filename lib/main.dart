import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'dummy_projects/ecommerce/splash/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

///runApp
///statelss: MyApp
///Material App
///Scafflod
///Center
///Text
///Icon
///SizedBox
///Column
///Row
///Padding
///AppBar
///Expanded
///CircleAvatar
///Stack
///TextFormField
///GestureDetector
///SingleChildScrollView
///ListView.builder
///ListView.separated
///Image.network
///Image.assets

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: themeData(),
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}

ThemeData themeData() {
  return ThemeData(
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.grey[200],
      border: InputBorder.none,
    ),
  );
}
