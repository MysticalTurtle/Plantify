import 'package:flutter/material.dart';
import 'package:recog_plantify/core/constants/app_colors.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: size.width,
          height: size.height,
          color: Colors.black.withOpacity(0.7),
        ),
        const Center(
          child: SizedBox(
            height: 150,
            width: 150,
            child: CircularProgressIndicator(
              color: AppColors.primaryGreen,
              strokeWidth: 8,
            ),
          ),
        ),
      ],
    );
  }
}
