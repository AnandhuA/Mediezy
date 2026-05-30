import 'package:flutter/material.dart';
import 'package:mediezy/core/themes/theme_extensions.dart';

class AppScaffold extends StatelessWidget {
  final Widget child;
  final bool scrollable;
  final bool bottomInset;
  final EdgeInsetsGeometry? padding;
  final PreferredSizeWidget? appBar;
  final Widget? floatingActionButton;

  const AppScaffold({
    super.key,
    required this.child,
    this.scrollable = false,
    this.bottomInset = false,
    this.padding,
    this.appBar,
    this.floatingActionButton,
  });

  @override
  Widget build(BuildContext context) {
    final content = Padding(
      padding:
          padding ?? const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: child,
    );

    return Scaffold(
      backgroundColor: context.background,
      appBar: appBar,
      floatingActionButton: floatingActionButton,
      resizeToAvoidBottomInset: bottomInset,

      body: SafeArea(
        child: scrollable ? SingleChildScrollView(child: content) : content,
      ),
    );
  }
}
