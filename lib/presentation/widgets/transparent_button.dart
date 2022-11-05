import 'package:flutter/material.dart';
import 'package:recog_plantify/core/constants/app_colors.dart';

class TransparentButton extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  const TransparentButton({super.key, required this.text, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(color: AppColors.primaryGreen),
          ),
        ),
      ),
    );
  }
}
