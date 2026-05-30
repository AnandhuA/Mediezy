import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mediezy/core/constants/app_assets.dart';
import 'package:mediezy/core/responsive/responsive.dart';
import 'package:mediezy/core/style/app_text_styles.dart';
import 'package:mediezy/core/themes/app_colors.dart';
import 'package:mediezy/core/widgets/app_scaffold.dart';
import 'package:mediezy/features/attendance/view/route_list_screen.dart';
import 'package:mediezy/features/attendance/view_model/attendance_provider.dart';
import 'package:mediezy/features/dashboard/view_model/dashboard_provider.dart';
import 'package:mediezy/features/dashboard/widgets/activity_card_widget.dart';
import 'package:mediezy/features/dashboard/widgets/card_widget.dart';
import 'package:mediezy/features/attendance/widgets/mark_attendance_widget.dart';
import 'package:mediezy/features/leave/view/apply_leave_screen.dart';
import 'package:provider/provider.dart';
import 'package:transformable_list_view/transformable_list_view.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<DashboardProvider>().init(context);
       context.read<AttendanceProvider>()
      .getAttendanceStatus();
    });
  }

  @override
  Widget build(BuildContext context) {
    log("rebuild--");
    return AppScaffold(
      child: Column(
        children: [
          SizedBox(height: context.res.hlg),
          CircleAvatar(radius: 34, child: Image.asset(AppAssets.profileImage)),
          Consumer<DashboardProvider>(
            builder: (_, provider, _) {
              return Text(
                "Hi ${provider.userName}",
                style: AppTextStyles.headlineLarge,
              );
            },
          ),
          Text("Sales Executive"),

          Row(
            mainAxisAlignment: .center,
            children: [
              Icon(Icons.location_on_outlined, size: 16),
              Consumer<DashboardProvider>(
                builder: (_, provider, _) {
                  return Text(
                    provider.currentLocation,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  );
                },
              ),
            ],
          ),
          SizedBox(height: context.res.hsm),
          MarkAttendanceWidget(),
          SizedBox(height: context.res.hsm),
          Row(
            children: [
              Expanded(
                child: CardWidget(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MyRouteListScreen(),
                      ),
                    );
                  },
                  gradient: AppColors.primaryGradient,
                  icon: Image.asset(AppAssets.routeIcon, scale: 0.7),
                  title: "Route",
                ),
              ),
              Expanded(
                child: CardWidget(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ApplyLeaveScreen(),
                      ),
                    );
                  },
                  color: AppColors.white,
                  icon: Image.asset(AppAssets.calenderIcon, scale: 0.7),
                  title: "Apply Leave",
                ),
              ),
            ],
          ),
          SizedBox(height: context.res.hsm),
          Row(
            mainAxisAlignment: .spaceBetween,
            children: [
              Text("Recent Activity", style: AppTextStyles.labelLarge),
              Text("View All", style: AppTextStyles.labelLarge),
            ],
          ),
          SizedBox(height: context.res.hxs),
          Expanded(
            child: TransformableListView.builder(
              getTransformMatrix: getTransformMatrix,
              itemBuilder: (context, index) {
                return ActivityCard();
              },
              itemCount: 30,
            ),
          ),
          // SizedBox(height: context.res.hmd),
        ],
      ),
    );
  }

  Matrix4 getTransformMatrix(TransformableListItem item) {
    final progress = 1 - (item.visibleExtent / item.size.height);

    return Matrix4.identity()
      ..translate(0.0, 40 * progress)
      ..scale(1 - (0.1 * progress));
  }
}
