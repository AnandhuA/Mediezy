import 'package:flutter/material.dart';
import 'package:mediezy/core/themes/theme_extensions.dart';

class LeaveTimeline extends StatelessWidget {
  final String finalStatus;
  final Color finalStatusColor;
  final IconData finalStatusIcon;

  const LeaveTimeline({
    super.key,
    required this.finalStatus,
    required this.finalStatusColor,
    required this.finalStatusIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.check_circle, color: context.primary, size: 18),
        const SizedBox(width: 4),
        const Text("Create"),

        const SizedBox(width: 10),
        const Expanded(child: Divider()),

        Icon(Icons.check_circle, color: context.primary, size: 18),
        const SizedBox(width: 4),
        const Text("Review"),

        const SizedBox(width: 10),
        const Expanded(child: Divider()),

        Icon(finalStatusIcon, color: finalStatusColor, size: 18),
        const SizedBox(width: 4),
        Text(finalStatus),
      ],
    );
  }
}
