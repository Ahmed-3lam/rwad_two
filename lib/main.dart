import 'package:flutter/material.dart';

import 'dummy_projects/messanger/messanger_screen.dart';

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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MessangerScreen(),
    );
  }
}
