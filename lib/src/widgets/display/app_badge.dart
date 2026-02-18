import 'package:flutter/material.dart';
import '../../../core_ui.dart';

class AppBadge extends StatelessWidget {
  final String? label;
  final Widget child;
  final Color? color;
  final bool show;

  const AppBadge({
    super.key,
    required this.child,
    this.label,
    this.color,
    this.show = true,
  });

  @override
  Widget build(BuildContext context) {
    if (!show) return child;

    return Stack(
      alignment: Alignment.topRight,
      children: [
        child,
        Positioned(
          right: 0,
          top: 0,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
            decoration: BoxDecoration(
              color: color ?? AppColors.error,
              borderRadius: BorderRadius.circular(AppRadius.full),
            ),
            constraints: const BoxConstraints(minWidth: 16, minHeight: 16),
            alignment: Alignment.center,
            child: label != null
                ? Text(
                    label!,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                : null,
          ),
        ),
      ],
    );
  }
}
