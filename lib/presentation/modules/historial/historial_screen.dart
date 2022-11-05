import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recog_plantify/core/constants/app_colors.dart';
import 'package:recog_plantify/core/constants/app_text_style.dart';
import 'package:recog_plantify/domain/entities/user.dart';
import 'package:recog_plantify/presentation/modules/auth/cubit/auth_cubit.dart';

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
            RichText(
              text: TextSpan(
                text: "Bienvenido ",
                style: TextStyles.lastOnboardingBlack,
                children: [
                  TextSpan(
                    text: user.name,
                    style: TextStyles.lastOnboardingGreen,
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            const Text(
              "¿Listo para aprender sobre tus plantas favoritas?\n",
              style: TextStyles.lastOnboardingBlack400,
            ),
            const Text(
              "Revisa tu historial",
              style: TextStyles.onboardingMainText,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            Image.asset("assets/images/home2.png"),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/images/leaf_empty.png"),
                const SizedBox(width: 10),
                Image.asset("assets/images/leaf_filled.png"),
                const SizedBox(width: 10),
                Image.asset("assets/images/leaf_empty.png"),
              ],
            ),
            const SizedBox(height: 10),
            const Text(
                '''Revisar lo que has analizado es otra manera de aprender más sobre tu planta favorita. ¡No te olvides de chequear tu historial cada cierto tiempo!

Además, ahí también se encuentran los tokens restantes en tu cuenta, no viene mal verificar cuántos te quedan, ¿verdad?''',
                style: TextStyles.lastOnboardingBlack400),
            const SizedBox(height: 20),
            const Text(
              "¿Qué esperas?",
              style: TextStyles.onboardingDescription,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            const Text("¡Comienza ya!", textAlign: TextAlign.center),
            const SizedBox(height: 20),
            CircleAvatar(
              backgroundColor: AppColors.darkGreen,
              child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.history,
                  color: AppColors.primaryWhite,
                ),
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
