import 'package:flutter/material.dart';
import 'package:mediezy/core/style/app_text_styles.dart';

import '../themes/app_colors.dart';

class GradientButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final double height;
  final double radius;
  final double? width;
  final Widget? child;

  const GradientButton({
    super.key,
    required this.title,
    required this.onTap,
    this.height = 40,
    this.radius = 20,
    this.width,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(radius),
      onTap: onTap,
      child: Ink(
        height: height,
        width: width,
        decoration: BoxDecoration(
          gradient: AppColors.primaryGradient,
          borderRadius: BorderRadius.circular(radius),
        ),
        child: Center(
          child:
              child ??
              Text(
                title,
                style: AppTextStyles.labelLarge.copyWith(
                  color: AppColors.whiteText,
                ),
              ),
        ),
      ),
    );
  }
}
