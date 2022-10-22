import 'package:flutter/material.dart';
import 'package:recog_plantify/core/constants/app_colors.dart';
import 'package:recog_plantify/core/constants/app_text_style.dart';
import 'package:recog_plantify/presentation/widgets/light_button.dart';

import 'onboarding_second_screen.dart';
import 'widgets/dots.dart';

class OnboardingFirstScreen extends StatelessWidget {
  const OnboardingFirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 50),
          child: Column(
            children: [
              const Text("RecogPlantify",
                  textAlign: TextAlign.center,
                  style: TextStyles.onboardingTitle),
              const SizedBox(height: 30),
              Image.asset("assets/images/onboarding1.png"),
              const SizedBox(height: 30),
              const Text("Reconocimiento por IA",
                  textAlign: TextAlign.center,
                  style: TextStyles.onboardingMainText),
              const SizedBox(height: 30),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                    "Podrás identificar la información  de más de 50.000 plantas",
                    textAlign: TextAlign.justify,
                    style: TextStyles.onboardingDescription),
              ),
              const Spacer(),
              const Dots(currentIndex: 1),
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  LightButton(
                    backgroundColor: Colors.transparent,
                    textColor: AppColors.darkGreen,
                    text: "Omitir",
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(
                          builder: (context) => const OnboardingSecondScreen()),);
                    },
                  ),
                  LightButton(
                    text: "Continuar",
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(
                          builder: (context) => const OnboardingSecondScreen()),);
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
