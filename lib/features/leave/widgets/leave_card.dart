import 'package:flutter/material.dart';
import 'package:mediezy/core/themes/app_colors.dart';
import 'package:mediezy/features/leave/models/leave_model.dart';

import 'leave_timeline.dart';

class LeaveCard extends StatelessWidget {
  final LeaveModel leave;
  final VoidCallback? onDelete;

  const LeaveCard({super.key, required this.leave, this.onDelete});

  @override
  Widget build(BuildContext context) {
    late Color statusColor;
    late IconData statusIcon;
    late String statusText;

    switch (leave.status) {
      case LeaveStatus.approved:
        statusColor = AppColors.approved;
        statusIcon = Icons.check_circle;
        statusText = "Approved";
        break;

      case LeaveStatus.pending:
        statusColor = AppColors.pending;
        statusIcon = Icons.remove_circle;
        statusText = "Pending";
        break;

      case LeaveStatus.rejected:
        statusColor = AppColors.rejected;
        statusIcon = Icons.cancel;
        statusText = "Rejected";
        break;
    }

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(blurRadius: 5, color: AppColors.secondary.withOpacity(.08)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.topRight,
            child: onDelete == null
                ? const SizedBox()
                : IconButton(
                    onPressed: onDelete,
                    icon: const Icon(Icons.delete_outline, size: 18),
                  ),
          ),

          Text(leave.title, style: const TextStyle(color: AppColors.lightHintText)),

          Text(
            leave.date,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),

          Text(leave.type, style: const TextStyle(color: Colors.amber)),

          const SizedBox(height: 16),

          LeaveTimeline(
            finalStatus: statusText,
            finalStatusColor: statusColor,
            finalStatusIcon: statusIcon,
          ),
        ],
      ),
    );
  }
}
