import 'package:flutter/material.dart';
import 'package:recog_plantify/core/constants/app_colors.dart';
import 'package:recog_plantify/core/constants/app_text_style.dart';

class CustomTextInput extends StatelessWidget {
  final String hintText;
  final String? text;
  final FocusNode? currentNode;
  final FocusNode? nextNode;
  final bool isNumeric;
  final bool autofocus;
  final String? errorMessage;
  final void Function(String)? onChanged;
  final TextEditingController? controller;
  final bool isPassword;
  final String? Function(String?)? validator;
  const CustomTextInput({
    super.key,
    this.text,
    required this.hintText,
    this.currentNode,
    this.nextNode,
    this.isNumeric = false,
    required this.autofocus,
    this.errorMessage,
    this.onChanged,
    this.controller,
    this.isPassword = false,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    // if (controller != null && text != null) {
    //   controller!.text = text!;
    //   print("El texto es: $text");
    // }
    return Padding(
      padding: errorMessage == null
          ? const EdgeInsets.fromLTRB(0, 0, 0, 33)
          : const EdgeInsets.fromLTRB(0, 0, 0, 10),
      child: TextFormField(
        obscureText: isPassword,
        autocorrect: !isPassword,
        enableSuggestions: !isPassword,
        controller: controller,
        onChanged: onChanged,
        autofocus: autofocus,
        keyboardType: isNumeric ? TextInputType.number : TextInputType.name,
        validator: validator,
        decoration: InputDecoration(
          fillColor: AppColors.primaryWhite,
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.border, width: 2.0),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.border),
          ),
          hintText: hintText,
          hintStyle: TextStyles.kTextFormField,
          errorText: errorMessage,
          errorMaxLines: 2,
        ),
        focusNode: currentNode,
        onFieldSubmitted: (_) {
          FocusScope.of(context).requestFocus(nextNode);
        },
      ),
    );
  }
}
