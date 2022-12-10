import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recog_plantify/core/constants/app_colors.dart';
import 'package:recog_plantify/presentation/cubits/api_key/api_key_cubit.dart';

import 'core/config/router.dart';
import 'injection_container.dart' as di;
import 'injection_container.dart';
import 'package:recog_plantify/presentation/cubits/login/auth_cubit.dart';
import 'presentation/modules/onboarding/onboarding_screen.dart';
import 'presentation/modules/splash/splash_screen.dart';

void main() async {
  RouterMain.setupRouter();

  await di.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthCubit>(
          lazy: false,
          create: (context) => sl<AuthCubit>()..checkAuth(),
        ),
        BlocProvider<ApiKeyCubit>(
          create: (context) => sl<ApiKeyCubit>(),
        ),
      ],
      child: MaterialApp(
        onGenerateRoute: RouterMain.router.generator,
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          fontFamily: "Archivo",
          primarySwatch: Colors.green,
          textSelectionTheme: const TextSelectionThemeData(
            cursorColor: AppColors.primaryGreen,
            selectionColor: AppColors.primaryGreen,
            selectionHandleColor: AppColors.primaryGreen,
          ),
        ),
        home: const OnboardingScreen(),
      ),
    );
  }
}
