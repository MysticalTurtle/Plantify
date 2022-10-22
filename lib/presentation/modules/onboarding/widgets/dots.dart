import 'package:flutter/material.dart';
import 'package:recog_plantify/core/constants/app_colors.dart';

class Dots extends StatelessWidget {
  final int currentIndex;
  const Dots({super.key, required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (var i = 0; i < 3; i++)
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 5),
            width: 10,
            height: 10,
            decoration: BoxDecoration(
              color: i < currentIndex? AppColors.lightGreen : Colors.grey,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
      ],
    );
  }
}