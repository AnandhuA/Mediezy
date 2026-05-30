import 'package:flutter/material.dart';
import 'package:mediezy/core/network/api_exception.dart';
import 'package:mediezy/features/leave/service/leave_service.dart';

class LeaveProvider extends ChangeNotifier {
  final LeaveService _service = LeaveService();

  bool isLoading = false;

  String? errorMessage;

  String leaveType = "";
  String startDate = "";
  String endDate = "";
  String reason = "";

  Future<bool> applyLeave({required String leaveMode}) async {
    try {
      isLoading = true;
      errorMessage = null;

      notifyListeners();

      await _service.applyLeave(
        leaveMode: leaveMode,
        leaveType: leaveType,
        startDate: startDate,
        endDate: endDate,
        reason: reason,
      );

      return true;
    } on ApiException catch (e) {
      errorMessage = e.message;
      return false;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }


  void setLeaveType(String value) {
  leaveType = value;
  notifyListeners();
}

void setStartDate(String value) {
  startDate = value;
  notifyListeners();
}

void setEndDate(String value) {
  endDate = value;
  notifyListeners();
}

void setReason(String value) {
  reason = value;
  notifyListeners();
}
}
