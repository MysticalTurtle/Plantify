import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recog_plantify/core/constants/app_colors.dart';
import 'package:recog_plantify/core/constants/app_text_style.dart';
import 'package:recog_plantify/domain/entities/user.dart';
import 'package:recog_plantify/presentation/cubits/login/auth_cubit.dart';

class HistorialScreen extends StatelessWidget {
  const HistorialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    User user = (context.read<AuthCubit>().state as Authenticated).user;
    return Container(
      color: AppColors.backgroundColor,
      child: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 50),
          children: [
            
          ],
        ),
      ),
    );
  }
}
