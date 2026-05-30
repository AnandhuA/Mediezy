import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:mediezy/core/constants/key.dart';
import 'package:mediezy/core/themes/app_colors.dart';
import 'package:mediezy/core/utils/shared_pref_fun.dart';
import 'package:mediezy/core/widgets/app_scaffold.dart';
import 'package:mediezy/features/auth/view/login_screen.dart';
import 'package:mediezy/features/dashboard/view/dashboard_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _initialize();
  }

  Future<void> _initialize() async {
    await Future.delayed(const Duration(seconds: 2));

    final isLoggedIn = SharedPref.getBool(AppKeys.isLoggedIn);

    if (!mounted) return;

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) =>
            isLoggedIn ? const DashboardScreen() : const LoginScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 120,
              width: 120,
              decoration: BoxDecoration(
                gradient: AppColors.primaryGradient,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.location_on,
                color: AppColors.white,
                size: 60,
              ),
            ),

            // SpinKitThreeBounce(color: AppColors.primary),
          ],
        ),
      ),
    );
  }
}
