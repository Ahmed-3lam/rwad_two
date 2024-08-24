import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:rwad_two/dummy_projects/ecommerce/login/cubit/login_cubit.dart';

import 'dummy_projects/ecommerce/helpers/dio_helpers.dart';
import 'dummy_projects/ecommerce/helpers/hive_helper.dart';
import 'dummy_projects/ecommerce/register/cubit/register_cubit.dart';
import 'dummy_projects/ecommerce/splash/splash_screen.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox(HiveHelper.onboardingBox);
  await Hive.openBox(HiveHelper.token);
  DioHelpers.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LoginCubit()),
        BlocProvider(create: (context) => RegisterCubit()),
      ],
      child: GetMaterialApp(
        theme: themeData(),
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
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
