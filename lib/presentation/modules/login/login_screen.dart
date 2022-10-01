import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            debugPrint('TODO: Hacer el login.');
          },
          child: const Text('Iniciar Sesión'),
        ),
      ),
    );
  }
}
