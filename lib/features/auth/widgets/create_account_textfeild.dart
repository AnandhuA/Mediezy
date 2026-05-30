import 'package:flutter/material.dart';
import 'package:mediezy/core/style/app_text_styles.dart';

class CreateAccountTextfeild extends StatelessWidget {
  final String title;
  final String? hitText;
  final int maxLines;
  final bool isPasswordFeild;
  final TextInputType keyboardType;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  const CreateAccountTextfeild({
    super.key,
    required this.title,
    this.hitText,
    this.maxLines = 1,
    this.keyboardType = TextInputType.text,
    this.isPasswordFeild = false,
    this.controller,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 4,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Text(title, style: AppTextStyles.titleMedium),
        ),
        TextFormField(
          controller: controller,
          validator: validator,
          keyboardType: keyboardType,
          obscureText: isPasswordFeild,
          maxLines: maxLines,
          decoration: InputDecoration(hintText: hitText ?? "Enter $title"),
        ),
      ],
    );
  }
}
