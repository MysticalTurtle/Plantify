import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recog_plantify/core/constants/app_colors.dart';
import 'package:recog_plantify/presentation/cubits/login/auth_cubit.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _visible = false;
  bool _loading = false;

  @override
  void initState() {
    super.initState();
    _handleAnimation();
  }

  Future<void> _handleAnimation() async {
    await Future.delayed(const Duration(seconds: 1));
    if (!mounted) return;
    setState(() {
      _visible = true;
    });
    await Future.delayed(const Duration(seconds: 1));
    if (!mounted) return;
    setState(() {
      _loading = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        NavigatorState navigator = Navigator.of(context);
        if (state is Authenticated) {
          debugPrint("Va al Authenticated");
          navigator.pushReplacementNamed("home");
          // navigator.pushReplacementNamed("onboarding1");
          return;
        }
        if (state is Unauthenticated) {
          debugPrint("Va al Unauthenticated");
          Navigator.of(context).pushReplacementNamed("onboarding");
          return;
        }

        if (state is OnboardingNotViewed) {
          debugPrint("Va al Onboarding");
          navigator.pushReplacementNamed("onboarding");
          return;
        }
      },
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
              gradient: RadialGradient(
            colors: [AppColors.lightGreen, AppColors.primaryGreen],
            radius: 1.5,
            center: Alignment(0, -0.5),
          )),
          child: Center(
            child: _loading
                ? const CircularProgressIndicator(
                    color: AppColors.primaryWhite,
                  )
                : AnimatedOpacity(
                    opacity: _visible ? 1.0 : 0.0,
                    duration: const Duration(milliseconds: 400),
                    child: Image.asset(
                      "assets/icon/icon.png",
                      height: 200,
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
