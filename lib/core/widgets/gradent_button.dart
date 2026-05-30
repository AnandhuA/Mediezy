import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:mediezy/core/style/app_text_styles.dart';

import '../themes/app_colors.dart';

class GradientButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final double height;
  final double radius;
  final double? width;
  final Widget? child;
  final bool isLoading;

  const GradientButton({
    super.key,
    required this.title,
    required this.onTap,
    this.height = 45,
    this.radius = 30,
    this.isLoading = false,
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
          child: isLoading
              ? SpinKitThreeBounce(color: Colors.white, size: 16)
              : child ??
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
