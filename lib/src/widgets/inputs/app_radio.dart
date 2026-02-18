import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../../../core_ui.dart';

class AppRadio<T> extends StatelessWidget {
  final T value;
  final T? groupValue;
  final ValueChanged<T?>? onChanged;
  final Color? activeColor;

  const AppRadio({
    super.key,
    required this.value,
    required this.groupValue,
    this.onChanged,
    this.activeColor,
  });

  @override
  Widget build(BuildContext context) {
    final effectiveActiveColor = activeColor ?? AppColors.primary;

    final platform = Theme.of(context).platform;

    if (platform == TargetPlatform.iOS || platform == TargetPlatform.macOS) {
      return CupertinoRadio<T>(
        value: value,
        groupValue: groupValue,
        onChanged: onChanged,
        activeColor: effectiveActiveColor,
      );
    }

    return Radio<T>(
      value: value,
      groupValue: groupValue,
      onChanged: onChanged,
      activeColor: effectiveActiveColor,
    );
  }
}
