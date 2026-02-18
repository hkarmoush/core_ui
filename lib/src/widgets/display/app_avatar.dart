import 'package:flutter/material.dart';
import '../../../core_ui.dart';

class AppAvatar extends StatelessWidget {
  final String? imageUrl;
  final String? initials;
  final double size;
  final Color? backgroundColor;
  final Color? foregroundColor;

  const AppAvatar({
    super.key,
    this.imageUrl,
    this.initials,
    this.size = 40,
    this.backgroundColor,
    this.foregroundColor,
  });

  @override
  Widget build(BuildContext context) {
    final effectiveBackgroundColor = backgroundColor ?? AppColors.primary;
    final effectiveForegroundColor = foregroundColor ?? AppColors.onPrimary;

    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: effectiveBackgroundColor,
        shape: BoxShape.circle,
        image: imageUrl != null
            ? DecorationImage(image: NetworkImage(imageUrl!), fit: BoxFit.cover)
            : null,
      ),
      alignment: Alignment.center,
      child: imageUrl == null && initials != null
          ? Text(
              initials!,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: effectiveForegroundColor,
                fontSize: size * 0.4,
              ),
            )
          : null,
    );
  }
}
