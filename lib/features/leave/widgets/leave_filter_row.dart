import 'package:flutter/material.dart';
import 'package:mediezy/core/themes/app_colors.dart';
import 'package:mediezy/core/themes/theme_extensions.dart';

class LeaveFilterRow extends StatelessWidget {
  final String selectedMonth;
  final int leaveCount;
  final VoidCallback? onMonthTap;

  const LeaveFilterRow({
    super.key,
    required this.selectedMonth,
    required this.leaveCount,
    this.onMonthTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: InkWell(
            onTap: onMonthTap,
            borderRadius: BorderRadius.circular(20),
            child: Container(
              height: 38,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                border: Border.all(color: context.secondary, width: 2),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      selectedMonth,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      color: context.secondary,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Icon(
                      Icons.keyboard_arrow_down,
                      color: AppColors.white,
                      size: 20,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),

        const SizedBox(width: 16),

        Expanded(
          child: Container(
            height: 38,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              border: Border.all(color: context.secondary, width: 2),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              "Your Leave  ${leaveCount.toString().padLeft(2, '0')}",
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    );
  }
}
