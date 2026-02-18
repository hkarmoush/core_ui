import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../../../core_ui.dart';

class AppCheckbox extends StatelessWidget {
  final bool? value;
  final ValueChanged<bool?>? onChanged;
  final Color? activeColor;
  final Color? checkColor;

  const AppCheckbox({
    super.key,
    required this.value,
    this.onChanged,
    this.activeColor,
    this.checkColor,
  });

  @override
  Widget build(BuildContext context) {
    final effectiveActiveColor = activeColor ?? AppColors.primary;
    final effectiveCheckColor = checkColor ?? AppColors.onPrimary;

    final platform = Theme.of(context).platform;

    if (platform == TargetPlatform.iOS || platform == TargetPlatform.macOS) {
      return CupertinoCheckbox(
        value: value,
        onChanged: onChanged,
        activeColor: effectiveActiveColor,
        checkColor: effectiveCheckColor,
      );
    }

    return Checkbox(
      value: value,
      onChanged: onChanged,
      activeColor: effectiveActiveColor,
      checkColor: effectiveCheckColor,
    );
  }
}
