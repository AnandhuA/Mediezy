import 'package:flutter/material.dart';

class AppColors {
  static const Color primary = Color(0xFF03624C);
  static const Color secondary = Color(0xFF042222);
  // ================= LIGHT THEME =================

  static const Color lightPrimary = primary;
  static const Color lightSecondary = secondary;

  static const Color lightBackground = Color(0xFFF5F5F5);

  static const Color lightText = Color(0xFF111111);
  static const Color lightHintText = Color(0xFF7A7A7A);
  static const Color lightBorder = Color(0xFFE5E7EB);

  // ================= DARK THEME =================

  static const Color darkPrimary = primary;
  static const Color darkSecondary = secondary;

  static const Color darkBackground = Color(0xFF0F0F0F);
  static const Color darkSurface = Color(0xFF18181F);

  static const Color darkText = Colors.white;
  static const Color darkHintText = Colors.grey;
  static const Color darkBorder = Color(0xFF2C2C36);

  // ================= COMMON =================

  static const Color whiteText = Colors.white;
  static const Color blackText = Colors.black;

  static const Color border = Color(0xFFD9D9D9);

  static const Color success = Color(0xFF2E7D32);
  static const Color error = Color(0xFFD32F2F);

  // ================= GRADIENT =================

  static const LinearGradient primaryGradient = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [Color(0xFF042222), Color(0xFF03624C)],
  );
}
