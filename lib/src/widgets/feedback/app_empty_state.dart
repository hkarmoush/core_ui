import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../../../core_ui.dart';

class AppEmptyState extends StatelessWidget {
  final String title;
  final String? message;
  final Widget? image;
  final Widget? action;

  const AppEmptyState({
    super.key,
    required this.title,
    this.message,
    this.image,
    this.action,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.xl),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (image != null) ...[image!, const Gap(AppSpacing.lg)],
            Text(
              title,
              style: Theme.of(context).textTheme.headlineSmall,
              textAlign: TextAlign.center,
            ),
            if (message != null) ...[
              const Gap(AppSpacing.sm),
              Text(
                message!,
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium?.copyWith(color: AppColors.neutral600),
                textAlign: TextAlign.center,
              ),
            ],
            if (action != null) ...[const Gap(AppSpacing.lg), action!],
          ],
        ),
      ),
    );
  }
}
