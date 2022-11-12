import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recog_plantify/core/constants/app_colors.dart';

import 'core/config/router.dart';
import 'injection_container.dart' as di;
import 'injection_container.dart';
import 'presentation/modules/auth/cubit/auth_cubit.dart';
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
          create: (context) => sl<AuthCubit>()..checkAuth(),
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
              debugPrint("Va al Authenticated");
              navigator.pushReplacementNamed("home");
              return;
            }
            if (state is Unauthenticated) {
              debugPrint("Va al Unauthenticated");
              navigator.pushReplacementNamed("login");
              return;
            }
            debugPrint("Va al onboarding");
            navigator.pushReplacementNamed("onboarding1");
          },
          child: const SplashScreen(),
        ),
      ),
    );
  }
}
