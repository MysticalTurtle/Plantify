import 'package:flutter/material.dart';
import 'package:recog_plantify/core/constants/app_colors.dart';

class PlantyButton extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  final bool isDark;
  const PlantyButton({super.key, required this.text, this.onPressed, this.isDark = true});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: isDark? AppColors.primaryGreen: AppColors.lightGreen,
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(color: AppColors.primaryWhite),
          ),
        ),
      ),
    );
  }
}
