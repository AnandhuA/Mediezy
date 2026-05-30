import 'package:flutter/material.dart';
import 'package:mediezy/core/constants/app_assets.dart';
import 'package:mediezy/core/responsive/responsive.dart';
import 'package:mediezy/core/style/app_text_styles.dart';
import 'package:mediezy/core/themes/app_colors.dart';
import 'package:mediezy/core/utils/validators.dart';
import 'package:mediezy/core/widgets/app_scaffold.dart';
import 'package:mediezy/core/widgets/app_text_feild.dart';
import 'package:mediezy/core/widgets/gradent_button.dart';
import 'package:mediezy/features/auth/view_model/auth_provider.dart';
import 'package:mediezy/features/auth/widgets/create_account_textfeild.dart';

import 'package:provider/provider.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({super.key});

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  final _formKey = GlobalKey<FormState>();

  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _addressController = TextEditingController();
  final _dobController = TextEditingController();
  final _mobileNumberController = TextEditingController();
  final _locationController = TextEditingController();
  final _dojController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _addressController.dispose();
    _dobController.dispose();
    _dojController.dispose();
    _mobileNumberController.dispose();
    _passwordController.dispose();
    _locationController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = context.watch<AuthProvider>();
    return AppScaffold(
      scrollable: true,
      bottomInset: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        scrolledUnderElevation: 0,
        title: Text("Create Account", style: AppTextStyles.headlineSmall),
        actions: [
          CircleAvatar(radius: 20, child: Image.asset(AppAssets.profileImage)),
          SizedBox(width: context.res.wmd),
        ],
      ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: AppColors.secondary.withValues(alpha: 0.06),
                  blurRadius: 4,
                  spreadRadius: 0,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Form(
              key: _formKey,
              child: Column(
                spacing: 12,
                children: [
                  AppTextFeild(
                    title: "First Name",
                    validator: (value) =>
                        AppValidator.isRequired(value, fieldName: "First Name"),
                    controller: _firstNameController,
                  ),
                  CreateAccountTextfeild(
                    title: "Last Name",
                    validator: (value) =>
                        AppValidator.isRequired(value, fieldName: "Last Name"),
                    controller: _lastNameController,
                  ),
                  CreateAccountTextfeild(
                    title: "Email",
                    validator: AppValidator.email,
                    controller: _emailController,
                  ),
                  CreateAccountTextfeild(
                    title: "Address",
                    maxLines: 3,
                    validator: (value) =>
                        AppValidator.isRequired(value, fieldName: "Address"),
                    controller: _addressController,
                  ),
                  CreateAccountTextfeild(
                    title: "DOB",
                    validator: (value) =>
                        AppValidator.isRequired(value, fieldName: "DOB"),
                    controller: _dobController,
                  ),
                  CreateAccountTextfeild(
                    title: "Mobile Number",
                    validator: AppValidator.phone,
                    controller: _mobileNumberController,
                  ),
                  CreateAccountTextfeild(
                    title: "Location",
                    validator: (value) =>
                        AppValidator.isRequired(value, fieldName: "Location"),
                    controller: _locationController,
                  ),
                  CreateAccountTextfeild(
                    title: "DOJ",
                    hitText: "Enter Date of Joining",
                    validator: (value) => AppValidator.isRequired(
                      value,
                      fieldName: "Date of Joining",
                    ),
                    controller: _dojController,
                  ),
                  CreateAccountTextfeild(
                    title: "Password",
                    validator: AppValidator.password,
                    controller: _passwordController,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: context.res.hsm),
          GradientButton(
            title: "Save",
            isLoading: authProvider.isLoading,
            onTap: () async {
              if (_formKey.currentState!.validate()) {
                await context.read<AuthProvider>().login(
                  username: _firstNameController.text.trim(),
                  password: _passwordController.text.trim(),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
