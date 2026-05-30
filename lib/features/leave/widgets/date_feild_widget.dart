import 'package:flutter/material.dart';
import 'package:mediezy/core/constants/app_assets.dart';
import 'package:mediezy/core/themes/app_colors.dart';

class DateField extends StatelessWidget {
  final String hintText;
  final VoidCallback onTap;

  const DateField({super.key, required this.hintText, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: IgnorePointer(
        child: TextFormField(
          decoration: InputDecoration(
            hintText: hintText,
            suffixIcon: Image.asset(AppAssets.calendarColorIcon, scale: 3),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: AppColors.boderColor),
            ),
          ),
        ),
      ),
    );
  }
}
