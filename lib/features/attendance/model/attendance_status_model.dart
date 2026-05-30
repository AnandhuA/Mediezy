class AttendanceStatusModel {
  final String attendanceStatus;
  final String shiftStartTime;
  final String? markInTime;
  final String? markOutTime;

  AttendanceStatusModel({
    required this.attendanceStatus,
    required this.shiftStartTime,
    this.markInTime,
    this.markOutTime,
  });

  factory AttendanceStatusModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return AttendanceStatusModel(
      attendanceStatus:
          json["attendance_status"] ?? "",
      shiftStartTime:
          json["shift_start_time"] ?? "",
      markInTime:
          json["mark_in_time"]?.toString(),
      markOutTime:
          json["mark_out_time"]?.toString(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "attendance_status":
          attendanceStatus,
      "shift_start_time":
          shiftStartTime,
      "mark_in_time": markInTime,
      "mark_out_time": markOutTime,
    };
  }

  bool get isMarkedIn =>
      attendanceStatus == "marked_in";
}