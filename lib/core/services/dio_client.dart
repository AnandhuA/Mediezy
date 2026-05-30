import 'package:dio/dio.dart';
import 'package:mediezy/core/services/navigation_service.dart';

import '../constants/api_endpoints.dart';
import '../constants/key.dart';
import '../utils/shared_pref_fun.dart';

class DioClient {
  static final Dio dio = Dio(
    BaseOptions(
      baseUrl: ApiEndpoints.baseUrl,
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
    ),
  )..interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          final token = SharedPref.getString(
            AppKeys.token,
          );

          // Skip token for auth APIs
          final isAuthApi =
              options.path.contains(
                ApiEndpoints.login,
              ) ||
              options.path.contains(
                ApiEndpoints.createAccount,
              );

          if (!isAuthApi &&
              token.isNotEmpty) {
            options.headers["Authorization"] =
                "Bearer $token";
          }

          handler.next(options);
        },

        onError: (error, handler) async {
          if (error.response?.statusCode ==
              401) {
            // Token expired

            await SharedPref.clear();

            // Navigate to login
            NavigationService
                .navigatorKey
                .currentState
                ?.pushNamedAndRemoveUntil(
                  '/login',
                  (route) => false,
                );
          }

          handler.next(error);
        },
      ),
    );
}