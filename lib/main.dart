import 'package:flutter/material.dart';
import 'package:recog_plantify/core/constants/app_colors.dart';
import 'package:recog_plantify/presentation/modules/auth/login/login_screen.dart';
import 'package:recog_plantify/presentation/modules/onboarding/onboarding_first_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: "Archivo",
        primarySwatch: Colors.blue,
        textSelectionTheme: const TextSelectionThemeData(
          cursorColor: AppColors.primaryGreen,
          selectionColor: AppColors.primaryGreen,
          selectionHandleColor: AppColors.primaryGreen,
        ),
      ),
      home: const OnboardingFirstScreen(),
    );
  }
}
