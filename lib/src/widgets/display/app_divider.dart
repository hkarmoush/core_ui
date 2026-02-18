import 'package:flutter/material.dart';
import '../../../core_ui.dart';

class AppDivider extends StatelessWidget {
  final double? height;
  final double? thickness;
  final Color? color;

  const AppDivider({super.key, this.height, this.thickness, this.color});

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: height ?? AppSpacing.lg,
      thickness: thickness ?? 1,
      color: color ?? AppColors.neutral200,
    );
  }
}
