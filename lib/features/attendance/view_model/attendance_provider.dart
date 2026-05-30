import 'package:flutter/material.dart';
import 'package:mediezy/core/utils/permission_helper.dart';
import 'package:mediezy/features/attendance/model/attendance_status_model.dart';

import '../../../core/network/api_exception.dart';
import '../service/attendance_service.dart';

class AttendanceProvider extends ChangeNotifier {
  final AttendanceService _service = AttendanceService();

  bool isLoading = false;
  bool isMarkingAttendance = false;

  String? errorMessage;

  // bool isMarkedIn = false;

  bool get isMarkedIn => attendanceStatus?.isMarkedIn ?? false;

  AttendanceStatusModel? attendanceStatus;

  Future<void> getAttendanceStatus() async {
    try {
      isLoading = true;
      notifyListeners();

      attendanceStatus = await _service.getAttendanceStatus();
    } on ApiException catch (e) {
      errorMessage = e.message;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<bool> markAttendance({required BuildContext context}) async {
    isMarkingAttendance = true;
    errorMessage = null;

    notifyListeners();

    try {
      final position = await PermissionHelper.getCurrentLocation(context);

      if (position == null) {
        errorMessage = "Please enable location services";
        return false;
      }

      final attendanceStatus = isMarkedIn ? 2 : 1;

      await _service.markAttendance(
        attendanceStatus: attendanceStatus,
        latitude: position.latitude,
        longitude: position.longitude,
      );

      // isMarkedIn = true;
      // Refresh latest status
      await getAttendanceStatus();

      return true;
    } on ApiException catch (e) {
      errorMessage = e.message;
      return false;
    } finally {
      isMarkingAttendance = false;
      notifyListeners();
    }
  }
}
