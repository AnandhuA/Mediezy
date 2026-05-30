import 'package:flutter/material.dart';

import '../themes/app_colors.dart';

class AppButtonStyles {
  static final elevatedButton = ElevatedButton.styleFrom(
    backgroundColor: AppColors.primary,
    foregroundColor: Colors.white,

    elevation: 0,
    disabledBackgroundColor: AppColors.boderColor,
    padding: const EdgeInsets.symmetric(vertical: 12),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
  );

  static final textButton = TextButton.styleFrom(
    foregroundColor: AppColors.secondary,
    padding: const EdgeInsets.symmetric(vertical: 12),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(32),
      side: const BorderSide(color: AppColors.secondary, width: 2),
    ),
  );
}
