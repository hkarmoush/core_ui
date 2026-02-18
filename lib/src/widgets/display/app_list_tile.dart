import 'package:flutter/material.dart';
import '../../../core_ui.dart';

class AppListTile extends StatelessWidget {
  final Widget? leading;
  final Widget title;
  final Widget? subtitle;
  final Widget? trailing;
  final VoidCallback? onTap;
  final bool enabled;

  const AppListTile({
    super.key,
    this.leading,
    required this.title,
    this.subtitle,
    this.trailing,
    this.onTap,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: leading,
      title: DefaultTextStyle(
        style: Theme.of(context).textTheme.bodyLarge!,
        child: title,
      ),
      subtitle: subtitle != null
          ? DefaultTextStyle(
              style: Theme.of(
                context,
              ).textTheme.bodyMedium!.copyWith(color: AppColors.neutral600),
              child: subtitle!,
            )
          : null,
      trailing: trailing,
      onTap: enabled ? onTap : null,
      enabled: enabled,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.md,
        vertical: AppSpacing.xs,
      ),
    );
  }
}
