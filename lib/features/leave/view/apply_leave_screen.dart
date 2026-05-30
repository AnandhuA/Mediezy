import 'package:flutter/material.dart';
import 'package:mediezy/core/constants/app_assets.dart';
import 'package:mediezy/core/responsive/responsive.dart';
import 'package:mediezy/core/style/app_text_styles.dart';
import 'package:mediezy/core/themes/app_colors.dart';
import 'package:mediezy/core/widgets/app_scaffold.dart';
import 'package:mediezy/core/widgets/gradent_button.dart';
import 'package:mediezy/features/leave/view/fullday_leave_view.dart';
import 'package:mediezy/features/leave/view/halfday_leave_view.dart';
import 'package:mediezy/features/leave/view/leave_list_screen.dart';


class ApplyLeaveScreen extends StatelessWidget {
  const ApplyLeaveScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: AppScaffold(
        appBar: AppBar(
          scrolledUnderElevation: 0,
          backgroundColor: Colors.transparent,
          actions: [
            CircleAvatar(child: Image.asset(AppAssets.profileImage)),
            SizedBox(width: context.res.wmd),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,

          children: [
            Text("Apply Leave", style: AppTextStyles.headlineMedium),

            SizedBox(height: context.res.hmd),

            Container(
              height: 50,
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.secondary.withValues( alpha:  0.08),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: TabBar(
                dividerColor: Colors.transparent,
                indicatorSize: TabBarIndicatorSize.tab,
                labelColor: AppColors.white,
                unselectedLabelColor: AppColors.secondary,
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  gradient: AppColors.primaryGradient,
                ),
                tabs: const [
                  Tab(text: "Full Day"),
                  Tab(text: "Half Day"),
                ],
              ),
            ),

            SizedBox(height: context.res.hmd),

            Expanded(
              child: TabBarView(
                children: [FullDayLeaveView(), HalfDayLeaveView()],
              ),
            ),
            SizedBox(height: context.res.hmd),
            GradientButton(title: "Apply", onTap: () {}),
            SizedBox(height: context.res.hxs),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LeaveListScreen()),
                );
              },
              child: Text("Leave List"),
            ),
          ],
        ),
      ),
    );
  }
}
