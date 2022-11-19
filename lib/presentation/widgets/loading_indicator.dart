import 'package:flutter/material.dart';

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black.withOpacity(0.7),
      child: const Center(
        child: SizedBox(
          height: 100,
          width: 100,
          child: CircularProgressIndicator(strokeWidth: 5,),
        ),
      ),
    );
  }
}
