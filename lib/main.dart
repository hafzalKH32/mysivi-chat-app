import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mysivi/application/bloc_blinding/bloc_blinding.dart';
import 'package:mysivi/constant/app_theme/app_theme/app_theme.dart';
import 'package:mysivi/presentation/screen/splash_screen/SplashScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, __) {
        return SafeArea(
          bottom: Platform.isIOS ? false : true,
          top: false,
          left: false,
          right: false,
          child: MultiBlocProvider(
            providers: BlocBindings.initializer,
            child: GetMaterialApp(
                title: 'My Sivi - A Complete Chat Solution',
                debugShowCheckedModeBanner: false,
                theme: AppTheme.pinkTheme,
                darkTheme: AppTheme.blueTheme,
                themeMode: ThemeMode.light,
                home: const SplashScreen(),
            ),

          ),
        );
      },
    );
  }
}
