import 'package:flutter/material.dart';
import 'package:mediezy/core/widgets/app_scaffold.dart';
import 'package:mediezy/core/widgets/gradent_button.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      child: Column(
        spacing: 20,
        children: [
          ElevatedButton(onPressed: () {}, child: Text("data")),
          TextButton(onPressed: () {}, child: Text("xzf")),
          GradientButton(title: "Save", onTap: () {}),
        ],
      ),
    );
  }
}
