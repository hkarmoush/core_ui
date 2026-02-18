import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../../../core_ui.dart';

class AppSwitch extends StatelessWidget {
  final bool value;
  final ValueChanged<bool>? onChanged;
  final Color? activeColor;

  const AppSwitch({
    super.key,
    required this.value,
    this.onChanged,
    this.activeColor,
  });

  @override
  Widget build(BuildContext context) {
    final effectiveActiveColor = activeColor ?? AppColors.primary;

    final platform = Theme.of(context).platform;

    if (platform == TargetPlatform.iOS || platform == TargetPlatform.macOS) {
      return CupertinoSwitch(
        value: value,
        onChanged: onChanged,
        activeColor: effectiveActiveColor,
      );
    }

    return Switch(
      value: value,
      onChanged: onChanged,
      activeTrackColor: effectiveActiveColor,
    );
  }
}
