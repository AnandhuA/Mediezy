import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:mediezy/core/services/dio_client.dart';
import 'package:mediezy/features/attendance/model/attendance_status_model.dart';

import '../../../core/constants/api_endpoints.dart';
import '../../../core/network/api_exception.dart';
import '../../../core/utils/error_handler.dart';

class AttendanceService {
  final Dio dio = DioClient.dio;

  Future<AttendanceStatusModel> getAttendanceStatus() async {
    try {
      final response = await dio.get(ApiEndpoints.attendanceStatus);

      return AttendanceStatusModel.fromJson(response.data["attendance"]);
    } on DioException catch (e) {
      throw ApiException(ErrorHandler.extractErrorMessage(e.response?.data));
    }
  }

  Future<Map<String, dynamic>> markAttendance({
    required int attendanceStatus,
    required double latitude,
    required double longitude,
  }) async {
    try {
      final response = await dio.post(
        ApiEndpoints.markAttendance,
        data: {
          "attendance_status": attendanceStatus,
          "latitude": latitude,
          "longitude": longitude,
        },
      );
      log("$response");
      return response.data;
    } on DioException catch (e) {
      log("$e");
      log("STATUS: ${e.response?.statusCode}");
      log("DATA: ${e.response?.data}");

      throw ApiException(ErrorHandler.extractErrorMessage(e.response?.data));
    }
  }
}
