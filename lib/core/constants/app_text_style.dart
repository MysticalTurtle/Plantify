import 'package:flutter/material.dart';
import 'app_colors.dart';

class TextStyles {

  // Onboarding
  static const TextStyle onboardingTitle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w700,
    color: AppColors.primaryGreen,
  );
  static const TextStyle onboardingMainText = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w400,
    color: AppColors.primaryGreen,
  );
  static const TextStyle onboardingDescription = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: AppColors.darkGreen,
  );

  static const kLoginTitle = TextStyle(
      fontSize: 40, color: AppColors.primaryGreen, fontWeight: FontWeight.w600);
  static const kSubtitleMayus = TextStyle(
      fontSize: 12, color: AppColors.border, fontWeight: FontWeight.w400);
  static const kForgotPassword = TextStyle(
      fontSize: 12, color: AppColors.primaryBlack, fontWeight: FontWeight.w400);
  static const kWelcome = TextStyle(
      fontSize: 15, color: AppColors.primaryBlack, fontWeight: FontWeight.w400);
  static const kTextFormField = TextStyle(
      fontSize: 13,
      color: AppColors.blakOpacity04,
      fontWeight: FontWeight.w400);


}
