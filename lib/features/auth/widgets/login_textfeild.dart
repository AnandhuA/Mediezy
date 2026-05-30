import 'package:flutter/material.dart';
import 'package:mediezy/core/themes/app_colors.dart';

class LoginTextfeild extends StatelessWidget {
  final String hitText;
  final bool isPasswordFeild;
  final TextInputType keyboardType;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  const LoginTextfeild({
    super.key,
    required this.hitText,
    this.keyboardType = TextInputType.text,
    this.isPasswordFeild = false,
    this.controller,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // height: context.res.h(0.059),
      child: TextFormField(
        controller: controller,
        validator: validator,
        decoration: InputDecoration(
          hintText: hitText,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 12,
          ),

          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(32),
            borderSide: BorderSide.none,
          ),

          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(32),
            borderSide: const BorderSide(color: AppColors.boderColor, width: 1),
          ),

          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(32),
            borderSide: const BorderSide(color: AppColors.primary, width: 1.5),
          ),

          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(32),
            borderSide: const BorderSide(color: AppColors.error, width: 1.5),
          ),
        ),

        obscureText: isPasswordFeild,
        keyboardType: keyboardType,
      ),
    );
  }
}
