import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:rwad_two/dummy_projects/counter/cubit/counter_cubit.dart';
import 'package:rwad_two/dummy_projects/note/note_hive_helper.dart';

import 'dummy_projects/counter/counter_screen.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox(NoteHiveHelper.noteBox);
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
    return BlocProvider(
      create: (context) => CounterCubit(),
      child: GetMaterialApp(
        theme: themeData(),
        debugShowCheckedModeBanner: false,
        home: CounterScreen(),
      ),
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
