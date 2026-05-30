import 'package:flutter/material.dart';
import 'package:mediezy/core/themes/app_colors.dart';

class AppInputStyles {
  // ---------------- Light ----------------
  static final InputDecorationTheme
  lightInputDecorationTheme = InputDecorationTheme(
    filled: true,
    fillColor: AppColors.white,

    contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),

    hintStyle: const TextStyle(color: AppColors.lightHintText, fontSize: 14),

    labelStyle: const TextStyle(color: AppColors.lightHintText, fontSize: 14),

    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: AppColors.primary, width: 1.5),
    ),

    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(color: AppColors.boderColor, width: 1),
    ),

    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(color: AppColors.primary, width: 1.5),
    ),

    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(color: AppColors.error, width: 1.5),
    ),
  );

  // ---------------- Dark ----------------
  static final InputDecorationTheme
  darkInputDecorationTheme = InputDecorationTheme(
    filled: true,
    fillColor: AppColors.darkSurface,

    contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),

    hintStyle: const TextStyle(color: AppColors.darkHintText, fontSize: 14),

    labelStyle: const TextStyle(color: AppColors.darkHintText, fontSize: 14),

    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: AppColors.primary, width: 1.5),
    ),

    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(color: AppColors.darkBorder, width: 1),
    ),

    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(color: AppColors.darkPrimary, width: 1.5),
    ),

    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(color: AppColors.error, width: 1.5),
    ),
  );
}
