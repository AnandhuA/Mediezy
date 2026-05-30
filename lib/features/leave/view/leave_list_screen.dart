import 'package:flutter/material.dart';
import 'package:mediezy/core/constants/app_assets.dart';
import 'package:mediezy/core/responsive/responsive.dart';
import 'package:mediezy/core/widgets/app_scaffold.dart';
import 'package:mediezy/features/leave/models/leave_model.dart';
import 'package:mediezy/features/leave/widgets/leave_card.dart';
import 'package:mediezy/features/leave/widgets/leave_filter_row.dart';


import '../widgets/leave_status_tab.dart';

class LeaveListScreen extends StatefulWidget {
  const LeaveListScreen({super.key});

  @override
  State<LeaveListScreen> createState() => _LeaveListScreenState();
}

class _LeaveListScreenState extends State<LeaveListScreen> {
  int selectedTab = 0;

  final leaves = [
    LeaveModel(
      title: "Half Day Application",
      date: "Tue, Aug 20, 2025",
      type: "Casual",
      status: LeaveStatus.approved,
    ),
    LeaveModel(
      title: "Half Day Application",
      date: "Tue, Aug 20, 2025",
      type: "Casual",
      status: LeaveStatus.pending,
    ),
    LeaveModel(
      title: "Half Day Application",
      date: "Tue, Aug 20, 2025",
      type: "Casual",
      status: LeaveStatus.rejected,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        scrolledUnderElevation: 0,
        actions: [
          CircleAvatar(child: Image.asset(AppAssets.profileImage)),
          SizedBox(width: context.res.wmd),
        ],
      ),
      child: Column(
        children: [
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Leave List",
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
          ),

          SizedBox(height: context.res.hsm),

          Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Row(
              children: [
                LeaveStatusTab(
                  title: "All",
                  isSelected: selectedTab == 0,
                  onTap: () {
                    setState(() {
                      selectedTab = 0;
                    });
                  },
                ),
                LeaveStatusTab(
                  title: "Pending",
                  isSelected: selectedTab == 1,
                  onTap: () {
                    setState(() {
                      selectedTab = 1;
                    });
                  },
                ),
                LeaveStatusTab(
                  title: "Approved",
                  isSelected: selectedTab == 2,
                  onTap: () {
                    setState(() {
                      selectedTab = 2;
                    });
                  },
                ),
                LeaveStatusTab(
                  title: "Reject",
                  isSelected: selectedTab == 3,
                  onTap: () {
                    setState(() {
                      selectedTab = 3;
                    });
                  },
                ),
              ],
            ),
          ),

          SizedBox(height: context.res.hsm),

          LeaveFilterRow(
            selectedMonth: "January",
            leaveCount: 1,
            onMonthTap: () {
              // open month picker
            },
          ),

          SizedBox(height: context.res.hsm),

          Expanded(
            child: ListView.builder(
              itemCount: leaves.length,
              itemBuilder: (_, index) {
                return LeaveCard(leave: leaves[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}
