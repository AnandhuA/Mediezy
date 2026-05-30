import 'package:flutter/material.dart';
import 'package:mediezy/core/style/app_text_styles.dart';
import 'package:mediezy/core/themes/app_colors.dart';

class CardWidget extends StatelessWidget {
  final Gradient? gradient;

  final Color? color;
  final Widget icon;
  final String title;
  final VoidCallback onTap;
  const CardWidget({
    super.key,
    this.gradient,
    this.color,
   required this.onTap,
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(14),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: gradient,
          color: color,
          boxShadow: [
            BoxShadow(
              color: AppColors.secondary.withValues(alpha: 0.1),
              blurRadius: 2,
              spreadRadius: 0,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: .start,
          spacing: 16,
          children: [
            CircleAvatar(
              radius: 20,
              backgroundColor: color == null
                  ? AppColors.white
                  : AppColors.secondary,
              child: icon,
            ),
            Text(
              title,
              style: AppTextStyles.titleMedium.copyWith(
                color: color == null ? AppColors.white : AppColors.secondary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
