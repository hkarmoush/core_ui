import 'package:flutter/material.dart';
import '../../../core_ui.dart';

class AppCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final VoidCallback? onTap;
  final Color? color;

  const AppCard({
    super.key,
    required this.child,
    this.padding,
    this.onTap,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation:
          2, // Could use AppShadows if we implemented custom shadow rendering
      color: color ?? AppColors.surface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(AppRadius.lgRadius),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.all(AppRadius.lgRadius),
        child: Padding(
          padding: padding ?? const EdgeInsets.all(AppSpacing.md),
          child: child,
        ),
      ),
    );
  }
}
