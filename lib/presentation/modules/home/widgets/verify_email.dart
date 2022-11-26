import 'package:flutter/material.dart';

class VerifyEmail extends StatelessWidget {
  final void Function()? onTap;
  const VerifyEmail({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.only(bottom: 20),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(30)),
          color: Color(0xFF333333),
        ),
        child: Row(
          children: const [
            Icon(Icons.email, color: Colors.white),
            SizedBox(width: 10),
            Text("Verifica tu correo para usar la app", style: TextStyle(color: Colors.white),),
            Icon(Icons.navigate_next, color: Colors.white,),
          ],
        )
      ),
    );
  }
}
