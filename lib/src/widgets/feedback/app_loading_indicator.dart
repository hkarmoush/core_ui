import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../../../core_ui.dart';

class AppLoadingIndicator extends StatelessWidget {
  final Color? color;
  final double size;

  const AppLoadingIndicator({super.key, this.color, this.size = 24.0});

  @override
  Widget build(BuildContext context) {
    final effectiveColor = color ?? AppColors.primary;

    // A simple platform check for now. Ideally this could be abstracted further.
    // Since this package is pure Dart/Flutter, Platform.isIOS works.
    final platform = Theme.of(context).platform;

    if (platform == TargetPlatform.iOS || platform == TargetPlatform.macOS) {
      return CupertinoActivityIndicator(
        color: effectiveColor,
        radius: size / 2,
      );
    }

    return SizedBox(
      width: size,
      height: size,
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(effectiveColor),
        strokeWidth: 2.5,
      ),
    );
  }
}
