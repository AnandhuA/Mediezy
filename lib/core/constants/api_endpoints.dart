class ApiEndpoints {
  //BASEURL
  static const String baseUrl = "https://test.zyromate.com/api/";

  // AUTH
  static const String login = "/user-login";
  static const String createAccount = "/register";

  //ATTENDANCE
  static const String attendanceStatus = "/attendance/status";
  static const String markAttendance = "/attendance/mark";
  static const String attendanceRouteList = "/attendance/route-list";

  //LEAVE
  static const String applyLeave = "/apply-leave";
  static const String leaveList = "/leaves";
}
