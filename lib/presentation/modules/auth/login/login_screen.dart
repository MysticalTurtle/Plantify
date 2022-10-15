import 'package:flutter/material.dart';
import 'package:recog_plantify/core/constants/app_colors.dart';
import 'package:recog_plantify/core/constants/app_text_style.dart';
import 'package:recog_plantify/presentation/widgets/planty_button.dart';
import 'package:recog_plantify/presentation/widgets/planty_text_field.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SafeArea(
          child: Container(
            color: AppColors.backgroundColor,
            child: ListView(
              
              padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 50),
              children: [
                const Text("Plantify", style: TextStyles.kLoginTitle, textAlign: TextAlign.center,),
                Image.asset("assets/images/logo.png", width: 150, height: 150),
                const SizedBox(height: 20,),
                const Text("¡Bienvenido!", style: TextStyles.kWelcome ,textAlign: TextAlign.center),
                const SizedBox(height: 20,),
                const CustomTextInput(hintText: "Ingresar usuario", isNumeric: false, autofocus: false,),
                const CustomTextInput(hintText: "Ingresar contraseña", isNumeric: false, autofocus: false,),
                const PlantyButton(text: "Iniciar sesión"),
                const SizedBox(height: 20,),
                const Text("¿Olvidaste tu contraseña?", style: TextStyles.kForgotPassword, textAlign: TextAlign.center,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
