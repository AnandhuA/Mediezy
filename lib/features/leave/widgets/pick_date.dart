import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

Future<void> pickDate({
  required BuildContext context,
  required TextEditingController controller,
}) async {
  final date = await showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime.now(),
    lastDate: DateTime(2100),
  );

  if (date != null) {
 controller.text = DateFormat(
      'yyyy-MM-dd',
    ).format(date);
  }
}
