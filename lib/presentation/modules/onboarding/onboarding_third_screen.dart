import 'package:flutter/material.dart';
import 'package:recog_plantify/core/constants/app_colors.dart';
import 'package:recog_plantify/core/constants/app_text_style.dart';
import 'package:recog_plantify/presentation/widgets/light_button.dart';

import 'widgets/dots.dart';

class OnboardingThirdScreen extends StatelessWidget {
  const OnboardingThirdScreen({super.key});

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
              Image.asset("assets/images/onboarding3.png"),
              const SizedBox(height: 30),
              const Text("Observa el estado y cuidado de la planta",
                  textAlign: TextAlign.center,
                  style: TextStyles.onboardingMainText),
              const SizedBox(height: 30),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                    "No solo podrás identificar plantas, sino también su estado de salud actual. ¡Atento por si ves una alteración en tu planta favorita!",
                    textAlign: TextAlign.justify,
                    style: TextStyles.onboardingDescription),
              ),
              const Spacer(),
              const Dots(currentIndex: 3),
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Visibility (
                    visible: false,
                    child: LightButton(
                      backgroundColor: Colors.transparent,
                      textColor: AppColors.darkGreen,
                      text: "Omitir",
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(
                            builder: (context) => const OnboardingThirdScreen()),);
                      },
                    ),
                  ),
                  LightButton(
                    text: "Continuar",
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(
                          builder: (context) => const OnboardingThirdScreen()),);
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