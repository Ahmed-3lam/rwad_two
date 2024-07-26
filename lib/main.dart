import 'package:flutter/material.dart';
import 'package:rwad_two/widgets/my_appbar.dart';

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
      home: Scaffold(
        appBar: myAppBar(),
        body: Container(
          color: Colors.red,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                color: Colors.green,
                child: Row(
                  children: [
                    Icon(Icons.access_alarm),
                    Text("hello jjjjjjjjjjj"),
                  ],
                ),
              ),
              Text("hello  kkkkkkkkkkkkkkkkkkk"),
              Text("hello"),
              Text("hello"),
              Text("hello"),
              Text("hello"),
            ],
          ),
        ),
      ),
    );
  }
}
