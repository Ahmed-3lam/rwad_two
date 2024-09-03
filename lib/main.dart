import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:rwad_two/dummy_projects/ecommerce/language_cubit/language_cubit.dart';
import 'package:rwad_two/dummy_projects/ecommerce/login/cubit/login_cubit.dart';
import 'package:rwad_two/dummy_projects/ecommerce/native/native_code.dart';

import 'dummy_projects/bloc_observer.dart';
import 'dummy_projects/ecommerce/helpers/dio_helpers.dart';
import 'dummy_projects/ecommerce/helpers/hive_helper.dart';
import 'dummy_projects/ecommerce/home/cubit/home_cubit.dart';
import 'dummy_projects/ecommerce/register/cubit/register_cubit.dart';
import 'dummy_projects/ecommerce/splash/splash_screen.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox(HiveHelper.onboardingBox);
  await Hive.openBox(HiveHelper.token);
  await Hive.openBox(HiveHelper.KEY_BOX_APP_LANGUAGE);
  Bloc.observer = AppBlocObserver();
  DioHelpers.init();
  NativeBridge.getComplexData();

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
        BlocProvider(create: (context) => LanguageCubit()),
        BlocProvider(
            create: (context) => HomeCubit()
              ..getBanners()
              ..getProducts()),
      ],
      child: BlocBuilder<LanguageCubit, LanguageState>(
        builder: (context, state) {
          return GetMaterialApp(
            locale: state.locale,
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            theme: themeData(),
            debugShowCheckedModeBanner: false,
            home: SplashScreen(),
          );
        },
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
