import 'package:flutter/material.dart';

SnackBar getSnackBar(String snackText, bool success) {
  var icon = success
      ? const Icon(Icons.check, color: Colors.green)
      : const Icon(Icons.close, color: Colors.red);
  return SnackBar(
    content: Row(
      children: [
        icon,
        const SizedBox(width: 10),
        Text(
          snackText,
          textAlign: TextAlign.center,
        ),
      ],
    ),
    backgroundColor: const Color.fromARGB(255, 24, 24, 24),
    duration: const Duration(seconds: 2),
    behavior: SnackBarBehavior.floating,
  );
}
