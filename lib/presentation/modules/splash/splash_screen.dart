import 'package:flutter/material.dart';
import 'package:recog_plantify/core/constants/app_colors.dart';

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
    setState(() {
      _visible = true;
    });
    await Future.delayed(const Duration(seconds: 1));
    setState(() {
      _loading = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            gradient: RadialGradient(
          colors: [AppColors.lightGreen, AppColors.primaryGreen],
          radius: 1.5,
          center: Alignment(0, -0.5),
        )),
        child: Center(
          child: _loading?
          const CircularProgressIndicator(
            color: AppColors.primaryWhite,
          ):
          AnimatedOpacity(
            opacity: _visible ? 1.0 : 0.0,
            duration: const Duration(milliseconds: 400),
            child: Image.asset(
              "assets/icon/icon.png",
              height: 200,
            ),
          ),
        ),
      ),
    );
  }
}
