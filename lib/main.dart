import 'package:flutter/material.dart';
import 'package:mediezy/core/services/navigation_service.dart';
import 'package:mediezy/core/themes/app_theme.dart';
import 'package:mediezy/core/utils/shared_pref_fun.dart';
import 'package:mediezy/features/attendance/view_model/attendance_provider.dart';
import 'package:mediezy/features/auth/view/login_screen.dart';
import 'package:mediezy/features/auth/view_model/auth_provider.dart';
import 'package:mediezy/features/dashboard/view_model/dashboard_provider.dart';
import 'package:mediezy/features/leave/view_model/leave_provider.dart';
import 'package:mediezy/features/splash/view/splash_screen.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SharedPref.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => DashboardProvider()),
        ChangeNotifierProvider(create: (_) => AttendanceProvider()),
        ChangeNotifierProvider(create: (_) => LeaveProvider()),
      ],

      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: ThemeMode.light,
        navigatorKey: NavigationService.navigatorKey,
        routes: {"/login": (_) => const LoginScreen()},
        home: SplashScreen(),
      ),
    );
  }
}
