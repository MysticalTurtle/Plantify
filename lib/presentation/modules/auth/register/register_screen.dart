import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recog_plantify/core/constants/app_colors.dart';
import 'package:recog_plantify/core/constants/app_text_style.dart';
import 'package:recog_plantify/presentation/cubits/login/auth_cubit.dart';
import 'package:recog_plantify/presentation/widgets/custom_snackbar.dart';
import 'package:recog_plantify/presentation/widgets/loading_indicator.dart';
import 'package:recog_plantify/presentation/widgets/planty_button.dart';
import 'package:recog_plantify/presentation/widgets/planty_text_field.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  //Textfield nodes
  late FocusNode _nameNode;
  late FocusNode _lastNameNode;
  late FocusNode _emailNode;
  late FocusNode _userNameNode;
  late FocusNode _passwordNode;
  late FocusNode _confirmPasswordNode;

  //Controllers
  late TextEditingController _nameController;
  late TextEditingController _lastNameController;
  late TextEditingController _emailController;
  late TextEditingController _userNameController;
  late TextEditingController _passwordController;
  late TextEditingController _confirmPasswordController;

  //key
  late GlobalKey<FormState> _formKey;

  bool _isLoading = false;

  @override
  void initState() {
    _nameNode = FocusNode();
    _lastNameNode = FocusNode();
    _emailNode = FocusNode();
    _userNameNode = FocusNode();
    _passwordNode = FocusNode();
    _confirmPasswordNode = FocusNode();
    _formKey = GlobalKey<FormState>();

    _nameController = TextEditingController();
    _lastNameController = TextEditingController();
    _emailController = TextEditingController();
    _userNameController = TextEditingController();
    _passwordController = TextEditingController();
    _confirmPasswordController = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    _nameNode.dispose();
    _lastNameNode.dispose();
    _emailNode.dispose();
    _userNameNode.dispose();
    _passwordNode.dispose();
    _confirmPasswordNode.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthLoading) {
            setState(() => _isLoading = true);
            return;
          }

          if (state is AuthInitial) {
            Navigator.of(context).pushReplacementNamed("login");
            setState(() => _isLoading = false);
            ScaffoldMessenger.of(context)
                .showSnackBar(getSnackBar("Registro exitoso", true));
            return;
          }
          
          if (state is AuthFailure) {
            setState(() => _isLoading = false);
            ScaffoldMessenger.of(context)
                .showSnackBar(getSnackBar(state.message, false));
            return;
          }
        },
        child: Stack(
          children: [
            GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: SafeArea(
                child: Container(
                  color: AppColors.backgroundColor,
                  child: Form(
                    key: _formKey,
                    child: ListView(
                      padding: const EdgeInsets.symmetric(
                          vertical: 40, horizontal: 50),
                      children: [
                        const Text(
                          "Registro",
                          style: TextStyles.kLoginTitle,
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Image.asset("assets/images/logo.png",
                            width: 150, height: 150),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text("¡Bienvenido!",
                            style: TextStyles.kWelcome,
                            textAlign: TextAlign.center),
                        const SizedBox(
                          height: 20,
                        ),
                        CustomTextInput(
                          hintText: "Nombres",
                          isNumeric: false,
                          autofocus: false,
                          currentNode: _nameNode,
                          nextNode: _lastNameNode,
                          controller: _nameController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Por favor ingrese su nombre";
                            }
                            return null;
                          },
                        ),
                        CustomTextInput(
                          hintText: "Apellidos",
                          isNumeric: false,
                          autofocus: false,
                          currentNode: _lastNameNode,
                          nextNode: _emailNode,
                          controller: _lastNameController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Por favor ingrese su apellido";
                            }
                            return null;
                          },
                        ),
                        CustomTextInput(
                            hintText: "Correo electrónico",
                            isNumeric: false,
                            autofocus: false,
                            currentNode: _emailNode,
                            nextNode: _userNameNode,
                            controller: _emailController,
                            validator: (email) {
                              //validate email with regex
                              if (RegExp(
                                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                  .hasMatch(email ?? '')) {
                                return null;
                              } else {
                                return "Por favor ingrese un correo válido";
                              }
                            }),
                        CustomTextInput(
                          hintText: "Nombre de usuario",
                          isNumeric: false,
                          autofocus: false,
                          currentNode: _userNameNode,
                          nextNode: _passwordNode,
                          controller: _userNameController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Por favor ingrese su nombre de usuario";
                            }
                            return null;
                          },
                        ),
                        CustomTextInput(
                          hintText: "Contraseña",
                          isNumeric: false,
                          autofocus: false,
                          isPassword: true,
                          currentNode: _passwordNode,
                          nextNode: _confirmPasswordNode,
                          controller: _passwordController,
                          validator: (value) {
                            if (value == null) {
                              return "Por favor ingrese su contraseña";
                            }
                            if (value.isEmpty) {
                              return "Por favor ingrese su contraseña";
                            }
                            if (value.length < 6) {
                              return "La contraseña debe tener al menos 6 caracteres";
                            }
                            return null;
                          },
                        ),
                        CustomTextInput(
                          hintText: "Confirmar contraseña",
                          isNumeric: false,
                          autofocus: false,
                          isPassword: true,
                          currentNode: _confirmPasswordNode,
                          controller: _confirmPasswordController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Por favor confirme su contraseña";
                            }
                            if (value != _passwordController.text) {
                              return "Las contraseñas no coinciden";
                            }
                            return null;
                          },
                        ),
                        PlantyButton(
                          text: "Regístrate",
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              FocusScope.of(context).unfocus();
                              context.read<AuthCubit>().register(
                                    _userNameController.text,
                                    _emailController.text,
                                    _passwordController.text,
                                    _nameController.text,
                                    _lastNameController.text,
                                  );
                            }
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushReplacementNamed(context, "login");
                          },
                          child: const Text(
                            "¿Ya tienes una cuenta\nInicia sesión?",
                            style: TextStyles.kForgotPassword,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            _isLoading ? const LoadingIndicator() : const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
