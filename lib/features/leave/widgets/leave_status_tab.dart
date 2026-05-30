import 'package:flutter/material.dart';
import 'package:mediezy/core/themes/app_colors.dart';
import 'package:mediezy/core/themes/theme_extensions.dart';

class LeaveStatusTab extends StatelessWidget {
  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  const LeaveStatusTab({
    super.key,
    required this.title,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 38,
          decoration: BoxDecoration(
            color: isSelected ? context.primary : Colors.transparent,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Center(
            child: Text(
              title,
              style: TextStyle(
                color: isSelected ? AppColors.white : AppColors.secondary,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
