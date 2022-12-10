import 'package:flutter/material.dart';
import 'package:recog_plantify/core/constants/app_text_style.dart';

class InfoOnboarding extends StatelessWidget {
  const InfoOnboarding({
    super.key,
    required this.imagePath,
    required this.title,
    required this.description,
  });

  final String imagePath;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 50),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // const Text("RecogPlantify",
            //     textAlign: TextAlign.center, style: TextStyles.onboardingTitle),
            const SizedBox(height: 30),
            Image.asset(imagePath, height: 200,),
            const SizedBox(height: 30),
            Text(title,
                textAlign: TextAlign.center,
                style: TextStyles.onboardingMainText),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                description,
                textAlign: TextAlign.justify,
                style: TextStyles.onboardingDescription,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
