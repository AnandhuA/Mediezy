import 'package:flutter/material.dart';
import 'package:mediezy/core/style/app_text_styles.dart';
import 'package:mediezy/core/themes/app_colors.dart';
import 'package:mediezy/features/leave/view_model/leave_provider.dart';
import 'package:mediezy/features/leave/widgets/date_feild_widget.dart';
import 'package:mediezy/features/leave/widgets/pick_date.dart';
import 'package:provider/provider.dart';

class HalfDayLeaveView extends StatefulWidget {
  const HalfDayLeaveView({super.key});

  @override
  State<HalfDayLeaveView> createState() => _HalfDayLeaveViewState();
}

class _HalfDayLeaveViewState extends State<HalfDayLeaveView> {
  final fromDateController = TextEditingController();

  final toDateController = TextEditingController();

  @override
  void dispose() {
    fromDateController.dispose();
    toDateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: AppColors.secondary.withValues(alpha: 0.06),
            blurRadius: 6,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("From", style: AppTextStyles.titleMedium),
            const SizedBox(height: 8),
            DateField(
              controller: fromDateController,
              hintText: "YYYY/MM/DD",
              onTap: () async {
                await pickDate(
                  context: context,
                  controller: fromDateController,
                );
                if (context.mounted) {
                  context.read<LeaveProvider>().setStartDate(
                    fromDateController.text,
                  );
                }
              },
            ),

            const SizedBox(height: 16),

            const Text("To", style: AppTextStyles.titleMedium),
            const SizedBox(height: 8),
            DateField(
              controller: toDateController,
              hintText: "YYYY/MM/DD",
              onTap: () async {
                await pickDate(context: context, controller: toDateController);
                if (context.mounted) {
                  context.read<LeaveProvider>().setEndDate(
                    toDateController.text,
                  );
                }
              },
            ),

            const SizedBox(height: 16),

            const Text("Reason", style: AppTextStyles.titleMedium),
            const SizedBox(height: 8),
            TextFormField(
              maxLines: 4,
              decoration: InputDecoration(
                hintText: "Enter Leave reason",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),

            const SizedBox(height: 16),

            const Text("Leave Type", style: AppTextStyles.titleMedium),
            const SizedBox(height: 8),
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                hintText: "Select your Leave type",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              items: const [
                DropdownMenuItem(value: "Casual", child: Text("Casual")),
                DropdownMenuItem(value: "Sick", child: Text("Sick")),
              ],
              onChanged: (value) {
                if (value != null) {
                  context.read<LeaveProvider>().setLeaveType(value);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
