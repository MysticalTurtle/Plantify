import 'package:flutter/material.dart';
import 'package:recog_plantify/core/constants/app_colors.dart';

class PlantyButton extends StatelessWidget {
  final String text;
  final Function? onPressed;
  const PlantyButton({super.key, required this.text, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: AppColors.primaryGreen,
        borderRadius: BorderRadius.circular(30.0),
      ),
      child: Center(
        child: Text(
          text,
          style: const TextStyle(color: AppColors.primaryWhite),
        ),
      ),
    );
  }
}
