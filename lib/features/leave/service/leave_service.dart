import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:mediezy/core/constants/api_endpoints.dart';
import 'package:mediezy/core/constants/key.dart';
import 'package:mediezy/core/network/api_exception.dart';
import 'package:mediezy/core/services/dio_client.dart';
import 'package:mediezy/core/utils/error_handler.dart';
import 'package:mediezy/core/utils/shared_pref_fun.dart';

class LeaveService {
  Dio dio = DioClient.dio;
  Future<void> applyLeave({
    required String leaveMode,
    required String leaveType,
    required String startDate,
    required String endDate,
    required String reason,
  }) async {
    try {
      final userId = SharedPref.getString(AppKeys.userId);
      final response = await dio.post(
        ApiEndpoints.applyLeave,
        data: {
          "leave_mode": leaveMode,
          "leave_type": leaveType,
          "start_date": startDate,
          "end_date": endDate,
          "reason": reason,
          "user_id": userId,
        },
      );
      log("$response");
    } on DioException catch (e) {
      log("$e");
      log("STATUS: ${e.response?.statusCode}");
      log("DATA: ${e.response?.data}");
      throw ApiException(ErrorHandler.extractErrorMessage(e.response?.data));
    } catch (e) {
      log("ERROR: $e");

      throw ApiException("Something went wrong. Please try again.");
    }
  }
}
