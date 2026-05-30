enum LeaveStatus {
  approved,
  pending,
  rejected,
}

class LeaveModel {
  final String title;
  final String date;
  final String type;
  final LeaveStatus status;

  LeaveModel({
    required this.title,
    required this.date,
    required this.type,
    required this.status,
  });
}