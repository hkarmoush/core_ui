import 'package:flutter/material.dart';
import '../../../core_ui.dart';

class AppChip extends StatelessWidget {
  final String label;
  final VoidCallback? onDeleted;
  final VoidCallback? onPressed;
  final bool isSelected;
  final IconData? avatarIcon;

  const AppChip({
    super.key,
    required this.label,
    this.onDeleted,
    this.onPressed,
    this.isSelected = false,
    this.avatarIcon,
  });

  @override
  Widget build(BuildContext context) {
    return ActionChip(
      label: Text(label),
      avatar: avatarIcon != null ? Icon(avatarIcon, size: 16) : null,
      onPressed: onPressed,
      backgroundColor: isSelected
          ? AppColors.primary.withValues(alpha: 0.1)
          : null,

      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppRadius.full),
        side: isSelected
            ? const BorderSide(color: AppColors.primary)
            : const BorderSide(color: AppColors.neutral300),
      ),
      labelStyle: TextStyle(
        color: isSelected ? AppColors.primary : AppColors.onSurface,
      ),
    );
  }
}
