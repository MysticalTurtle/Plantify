import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recog_plantify/core/constants/app_colors.dart';

import 'core/config/router.dart';
import 'presentation/modules/auth/cubit/auth_cubit.dart';
import 'presentation/modules/splash/splash_screen.dart';

void main() {
  RouterMain.setupRouter();

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
          create: (context) => AuthCubit()..checkAuth(),
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
        home: BlocListener<AuthCubit, AuthState>(
          listener: (context, state) {
            NavigatorState navigator = Navigator.of(context);
            if (state is Authenticated) {
            print("Va al Authenticated");
              navigator.pushReplacementNamed("home");
              return;
            }
            if (state is Unauthenticated) {
            print("Va al Unauthenticated");
              navigator.pushReplacementNamed("login");
              return;
            }
            print("Va al onboarding");
            navigator.pushReplacementNamed("onboarding1");
          },
          child: const SplashScreen(),
        ),
      ),
    );
  }
}
