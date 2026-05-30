import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:mediezy/core/constants/app_assets.dart';
import 'package:mediezy/core/responsive/responsive.dart';
import 'package:mediezy/core/style/app_text_styles.dart';
import 'package:mediezy/core/themes/app_colors.dart';
import 'package:mediezy/core/themes/theme_extensions.dart';
import 'package:mediezy/core/utils/validators.dart';
import 'package:mediezy/core/widgets/app_scaffold.dart';
import 'package:mediezy/core/widgets/app_snackbar.dart';
import 'package:mediezy/features/auth/view/create_account_screen.dart';
import 'package:mediezy/features/auth/view_model/auth_provider.dart';
import 'package:mediezy/features/auth/widgets/login_textfeild.dart';
import 'package:mediezy/features/dashboard/view/dashboard_screen.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  final _numberController = TextEditingController();

  final _passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();

    _numberController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = context.watch<AuthProvider>();
    return AppScaffold(
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: context.res.h(0.12)),
            Image.asset(AppAssets.bannerImage),
            SizedBox(height: context.res.hlg),

            //=== USER NAME FEILD =================
            LoginTextfeild(
              hitText: "Mobile number",
              keyboardType: TextInputType.phone,
              controller: _numberController,
              validator: AppValidator.phone,
            ),
            SizedBox(height: context.res.hsm),

            //=== USER NAME FEILD =================
            LoginTextfeild(
              hitText: "Password",
              controller: _passwordController,
              isPasswordFeild: true,
              validator: AppValidator.password,
            ),
            SizedBox(height: context.res.hmd),

            //=== LOGIN BUTTON ============
            ElevatedButton(
              onPressed: authProvider.isLoading ? null : loginOnTap,
              child: authProvider.isLoading
                  ? SpinKitThreeBounce(color: AppColors.white, size: 16)
                  : Text("Login", style: AppTextStyles.labelLarge),
            ),
            SizedBox(height: context.res.hxs),

            //=== CREATE ACCOUNT ============
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CreateAccountScreen(),
                  ),
                );
              },
              style: TextButton.styleFrom(side: BorderSide(width: 2)),
              child: Text(
                "Create Account",
                style: AppTextStyles.labelLarge.copyWith(color: context.text),
              ),
            ),
            Spacer(),
            Center(
              child: Text(
                "Powered by Mediezy",
                style: TextStyle(color: context.hitText),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> loginOnTap() async {
    if (!_formKey.currentState!.validate()) return;

    final authProvider = context.read<AuthProvider>();

    final success = await authProvider.login(
      mobileNumber: _numberController.text.trim(),
      password: _passwordController.text.trim(),
    );

    if (!mounted) return;

    if (success) {
      AppSnackBar.success(context, "Login successful");

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const DashboardScreen()),
      );
    } else {
      AppSnackBar.error(context, authProvider.errorMessage ?? "Login failed");
    }
  }
}
