import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:mediezy/core/constants/api_endpoints.dart';
import 'package:mediezy/core/network/api_exception.dart';
import 'package:mediezy/core/services/dio_client.dart';
import 'package:mediezy/core/utils/error_handler.dart';

class AuthService {
  final Dio dio = DioClient.dio;

  Future<Map<String, dynamic>> login({
    required String mobileNumber,
    required String password,
  }) async {
    try {
      final response = await dio.post(
        ApiEndpoints.login,
        data: {"mobile_number": mobileNumber, "password": password},
      );
      log("$response");
      return response.data;
    } on DioException catch (e) {
      throw ApiException(ErrorHandler.extractErrorMessage(e.response?.data));
    } catch (_) {
      throw ApiException("Unexpected error occurred");
    }
  }

  Future<Map<String, dynamic>> register({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required String address,
    required String dob,
    required String mobileNumber,
    required String doj,
    required String location,
  }) async {
    try {
      final response = await DioClient.dio.post(
        ApiEndpoints.createAccount,
        data: {
          "first_name": firstName,
          "last_name": lastName,
          "email": email,
          "password": password,
          "address": address,
          "dob": dob,
          "mobile_number": mobileNumber,
          "doj": doj,
          "location": location,
        },
      );
      log("$response");
      return {
        "success": true,
        "data": response.data,
        "message": response.data["message"] ?? "Success",
      };
    } on DioException catch (e) {
      throw ApiException(ErrorHandler.extractErrorMessage(e.response?.data));
    } catch (e) {
      throw ApiException("Unexpected error occurred");
    }
  }
}
