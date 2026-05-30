import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mediezy/core/constants/key.dart';
import 'package:mediezy/core/network/api_exception.dart';
import 'package:mediezy/core/utils/shared_pref_fun.dart';

import '../service/auth_service.dart';

class AuthProvider extends ChangeNotifier {
  final AuthService _authService = AuthService();

  bool isLoading = false;
  String? errorMessage;

  //=======LOGIN =========
  Future<bool> login({
    required String mobileNumber,
    required String password,
  }) async {
    isLoading = true;
    errorMessage = null;

    notifyListeners();

    try {
      final response = await _authService.login(
        mobileNumber: mobileNumber,
        password: password,
      );
      //--------- set login tag as true ----------
      await SharedPref.setBool(AppKeys.isLoggedIn, true);
      //------------- save token -------------
      await SharedPref.setString(AppKeys.token, response["token"] ?? "");

      final user = response["user"];
      //----------save user data ------------
      if (user != null) {
        await SharedPref.setString(AppKeys.userId, user["user_id"].toString());

        await SharedPref.setString(AppKeys.userName, user["first_name"] ?? "");

        await SharedPref.setString(
          AppKeys.mobileNumber,
          user["mobile_number"] ?? "",
        );
      }

      return true;
    } on ApiException catch (e) {
      log("$e");
      errorMessage = e.message;
      return false;
    } catch (e) {
      log("$e");
      errorMessage = "Unexpected error occurred";
      return false;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  //=========REGISTER =======
  Future<bool> register({
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
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    try {
      final result = await _authService.register(
        firstName: firstName,
        lastName: lastName,
        email: email,
        password: password,
        address: address,
        dob: dob,
        mobileNumber: mobileNumber,
        doj: doj,
        location: location,
      );

      if (result["success"] == true) {
        await SharedPref.setBool(AppKeys.isLoggedIn, true);

        return true;
      }

      errorMessage = result["message"];
      return false;
    } on ApiException catch (e) {
      errorMessage = e.message;
      return false;
    } catch (e) {
      errorMessage = e.toString();
      return false;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
