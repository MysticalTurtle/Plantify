import 'package:flutter/material.dart';
import 'package:recog_plantify/core/constants/app_colors.dart';
import 'package:recog_plantify/core/constants/app_text_style.dart';
import 'package:recog_plantify/data/datasources/auth_datasource.dart';
import 'package:recog_plantify/domain/entities/user.dart';
import 'package:recog_plantify/presentation/modules/auth/cubit/auth_cubit.dart';
import 'package:recog_plantify/presentation/widgets/planty_button.dart';
import 'package:recog_plantify/presentation/widgets/planty_text_field.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //Textfield nodes
  late FocusNode _emailNode;
  late FocusNode _passwordNode;

  //Controllers
  late TextEditingController _emailController;
  late TextEditingController _passwordController;

  //Form key
  late GlobalKey<FormState> _formKey;

  @override
  void initState() {
    _emailNode = FocusNode();
    _passwordNode = FocusNode();

    _emailController = TextEditingController();
    _passwordController = TextEditingController();

    _formKey = GlobalKey<FormState>();

    super.initState();
  }

  @override
  void dispose() {
    _emailNode.dispose();
    _passwordNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SafeArea(
          child: Container(
            color: AppColors.backgroundColor,
            child: Form(
              key: _formKey,
              child: ListView(
                padding:
                    const EdgeInsets.symmetric(vertical: 40, horizontal: 50),
                children: [
                  const Text(
                    "Plantify",
                    style: TextStyles.kLoginTitle,
                    textAlign: TextAlign.center,
                  ),
                  Image.asset("assets/images/logo.png",
                      width: 150, height: 150),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text("¡Bienvenido!",
                      style: TextStyles.kWelcome, textAlign: TextAlign.center),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextInput(
                    hintText: "Ingresar usuario",
                    isNumeric: false,
                    autofocus: false,
                    currentNode: _emailNode,
                    nextNode: _passwordNode,
                    controller: _emailController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Por favor ingrese un usuario";
                      }
                      return null;
                    },
                  ),
                  CustomTextInput(
                    hintText: "Ingresar contraseña",
                    isNumeric: false,
                    autofocus: false,
                    isPassword: true,
                    currentNode: _passwordNode,
                    controller: _passwordController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Por favor ingrese un usuario";
                      }
                      return null;
                    },
                  ),
                  PlantyButton(
                    onPressed: () async {
                      if (!_formKey.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Corrija los campos"),
                          ),
                        );
                        return;
                      }
                      bool logged = await context.read<AuthCubit>().login(
                          _emailController.text, _passwordController.text);
                      if (logged) {
                        Navigator.pushNamed(context, "/home");
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Error al iniciar sesión"),
                          ),
                        );
                      }
                    },
                    text: "Iniciar sesión",
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, "/register");
                      },
                      child: const Text(
                        "¿No tienes una cuenta?\nRegístrate",
                        style: TextStyles.kForgotPassword,
                        textAlign: TextAlign.center,
                      )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
