import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:mediezy/core/constants/app_assets.dart';
import 'package:mediezy/core/responsive/responsive.dart';
import 'package:mediezy/core/style/app_text_styles.dart';
import 'package:mediezy/core/themes/app_colors.dart';
import 'package:mediezy/core/themes/theme_extensions.dart';
import 'package:mediezy/core/utils/permission_helper.dart';
import 'package:mediezy/core/widgets/app_snackbar.dart';
import 'package:mediezy/features/attendance/view_model/attendance_provider.dart';
import 'package:provider/provider.dart';

class MarkAttendanceWidget extends StatelessWidget {
  const MarkAttendanceWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AttendanceProvider>(
      builder: (_, provider, _) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
          decoration: BoxDecoration(
            gradient: AppColors.primaryGradient,
            borderRadius: BorderRadius.circular(40),
          ),
          child: Row(
            children: [
              SizedBox(width: context.res.wxs),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    provider.isMarkedIn
                        ? "Attendance Marked"
                        : "Start Your Day!",
                    style: AppTextStyles.titleMedium.copyWith(
                      color: AppColors.whiteText,
                    ),
                  ),

                  Text(
                    provider.isMarkedIn
                        ? "You have marked attendance"
                        : "Your shift start at ${provider.attendanceStatus?.shiftStartTime}",
                    style: TextStyle(color: context.whiteText),
                  ),
                ],
              ),

              const Spacer(),

              GestureDetector(
                // borderRadius: BorderRadius.circular(20),
                onTap: provider.isLoading
                    ? null
                    : () async {
                        final success = await provider.markAttendance(
                          context: context,
                        );

                        if (!context.mounted) {
                          return;
                        }

                        if (success) {
                          AppSnackBar.success(
                            context,
                            "Attendance marked successfully",
                          );
                        } else {
                          AppSnackBar.error(
                            context,
                            provider.errorMessage ??
                                "Failed to mark attendance",
                          );
                        }
                      },

                child: Container(
                  width: 110,
                  height: 42,
                  padding: EdgeInsets.symmetric(horizontal: 6),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),

                  child: provider.isLoading
                      ? const Center(
                          child: SpinKitThreeBounce(
                            color: AppColors.primary,
                            size: 14,
                          ),
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                          children: [
                            SizedBox(
                              height: 20,
                              width: 20,
                              child: Image.asset(
                                provider.isMarkedIn
                                    ? AppAssets.markOutIcon
                                    : AppAssets.markInIcon,
                              ),
                            ),

                            Text(
                              provider.isMarkedIn ? "Mark Out" : "Mark In",
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
