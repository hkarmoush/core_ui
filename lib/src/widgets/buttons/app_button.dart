import 'package:flutter/material.dart';
import '../../../core_ui.dart';

enum AppButtonType { primary, secondary, outline, ghost }

class AppButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final AppButtonType type;
  final IconData? icon;
  final bool isLoading;
  final bool isFullWidth;

  const AppButton({
    super.key,
    required this.text,
    this.onPressed,
    this.type = AppButtonType.primary,
    this.icon,
    this.isLoading = false,
    this.isFullWidth = false,
  });

  @override
  Widget build(BuildContext context) {
    Widget buttonContent = Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (isLoading) ...[
          SizedBox(
            width: 20,
            height: 20,
            child: CircularProgressIndicator(
              strokeWidth: 2,
              valueColor: AlwaysStoppedAnimation<Color>(
                type == AppButtonType.primary
                    ? AppColors.onPrimary
                    : AppColors.primary,
              ),
            ),
          ),
          const SizedBox(width: AppSpacing.sm),
        ],
        if (!isLoading && icon != null) ...[
          Icon(icon, size: 20),
          const SizedBox(width: AppSpacing.sm),
        ],
        Text(text),
      ],
    );

    Widget button;
    switch (type) {
      case AppButtonType.primary:
        button = ElevatedButton(
          onPressed: isLoading ? null : onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primary,
            foregroundColor: AppColors.onPrimary,
          ),
          child: buttonContent,
        );
        break;
      case AppButtonType.secondary:
        button = ElevatedButton(
          onPressed: isLoading ? null : onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.secondary,
            foregroundColor: AppColors.onSecondary,
          ),
          child: buttonContent,
        );
        break;
      case AppButtonType.outline:
        button = OutlinedButton(
          onPressed: isLoading ? null : onPressed,
          style: OutlinedButton.styleFrom(
            foregroundColor: AppColors.primary,
            side: const BorderSide(color: AppColors.primary),
          ),
          child: buttonContent,
        );
        break;
      case AppButtonType.ghost:
        button = TextButton(
          onPressed: isLoading ? null : onPressed,
          style: TextButton.styleFrom(foregroundColor: AppColors.primary),
          child: buttonContent,
        );
        break;
    }

    if (isFullWidth) {
      return SizedBox(width: double.infinity, child: button);
    }

    return button;
  }

  // Just a helper if we wanted to centralize style lookup
  ThemeData startStyle() {
    // Access theme from context if needed relative to where this is
    // But implementation above uses fixed colors for now based on Type
    return ThemeData.light();
  }
}
