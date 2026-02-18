import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../../../core_ui.dart';

class AppErrorWidget extends StatelessWidget {
  final String message;
  final VoidCallback? onRetry;
  final String? retryText;

  const AppErrorWidget({
    super.key,
    required this.message,
    this.onRetry,
    this.retryText,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error_outline, color: AppColors.error, size: 48),
            const Gap(AppSpacing.md),
            Text(
              message,
              style: Theme.of(
                context,
              ).textTheme.bodyLarge?.copyWith(color: AppColors.neutral700),
              textAlign: TextAlign.center,
            ),
            if (onRetry != null) ...[
              const Gap(AppSpacing.md),
              AppButton(
                text: retryText ?? 'Retry',
                onPressed: onRetry,
                type: AppButtonType.outline,
              ),
            ],
          ],
        ),
      ),
    );
  }
}
