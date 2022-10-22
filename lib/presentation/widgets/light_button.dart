import 'package:flutter/material.dart';
import 'package:recog_plantify/core/constants/app_colors.dart';

class LightButton extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  final Color backgroundColor;
  final Color textColor;

  const LightButton({
    super.key,
    required this.text,
    this.onPressed,
    this.backgroundColor = AppColors.lightGreen,
    this.textColor = AppColors.primaryWhite,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: textColor,
              fontWeight: FontWeight.w600,
              fontSize: 13,
            ),
          ),
        ),
      ),
    );
  }
}
