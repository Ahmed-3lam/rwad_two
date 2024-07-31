import 'package:flutter/material.dart';

import 'dummy_projects/whatsapp/whatsapp_screen.dart';

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

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WhatsappScreen(),
    );
  }
}
