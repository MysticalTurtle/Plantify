import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recog_plantify/core/constants/app_colors.dart';
import 'package:recog_plantify/core/constants/app_text_style.dart';
import 'package:recog_plantify/domain/entities/user.dart';
import 'package:recog_plantify/presentation/modules/auth/cubit/auth_cubit.dart';
import 'package:recog_plantify/presentation/modules/home/widgets/verify_email.dart';

class CameraScreen extends StatelessWidget {
  const CameraScreen({super.key});

  @override
  Widget build(BuildContext context) {
    User user = (context.read<AuthCubit>().state as Authenticated).user;
    return Container(
      color: AppColors.backgroundColor,
      child: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 50),
          children: [
            const VerifyEmail(),
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
              "Identifica y aprende",
              style: TextStyles.onboardingMainText,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            Image.asset("assets/images/home1.png"),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/images/leaf_filled.png"),
                const SizedBox(width: 10),
                Image.asset("assets/images/leaf_empty.png"),
                const SizedBox(width: 10),
                Image.asset("assets/images/leaf_empty.png"),
              ],
            ),
            const SizedBox(height: 10),
            const Text(
                '''Identifica tus plantas preferidas con solo apuntarlas con la cámara. ¡Es así de sencillo!

Recuerda que cada análisis e identificación gastan tokens en tu cuenta, ¡aprovecha los que tienes y disfruta de lo que te ofrece RecogPlantify!''',
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
                      Icons.camera,
                      color: AppColors.primaryWhite,
                    ))),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
