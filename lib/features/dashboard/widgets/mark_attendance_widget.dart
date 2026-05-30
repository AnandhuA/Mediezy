import 'package:flutter/material.dart';
import 'package:mediezy/core/constants/app_assets.dart';
import 'package:mediezy/core/responsive/responsive.dart';
import 'package:mediezy/core/themes/app_colors.dart';
import 'package:mediezy/core/themes/theme_extensions.dart';

class MarkAttendanceWidget extends StatelessWidget {
  const MarkAttendanceWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 18),
      decoration: BoxDecoration(
        gradient: AppColors.primaryGradient,
        borderRadius: BorderRadius.circular(40),
      ),
      child: Row(
        children: [
          SizedBox(width: context.res.wxs),
          Column(
            crossAxisAlignment: .start,
            children: [
              Text(
                "Start Your Day!",
                style: TextStyle(
                  color: context.whiteText,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              Text(
                "Your shift start at 9:30",
                style: TextStyle(color: context.whiteText),
              ),
            ],
          ),
          Spacer(),
          Container(
            width: 100,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            padding: EdgeInsets.all(10),
            child: Row(
              crossAxisAlignment: .center,
              mainAxisAlignment: .spaceAround,
              children: [
                SizedBox(
                  height: 20,
                  width: 20,
                  child: Image.asset(AppAssets.markInIcon),
                ),

                Text("Mark In", style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
