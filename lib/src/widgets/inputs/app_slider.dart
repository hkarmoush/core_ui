import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../../../core_ui.dart';

class AppSlider extends StatelessWidget {
  final double value;
  final ValueChanged<double>? onChanged;
  final double min;
  final double max;
  final int? divisions;
  final String? label;
  final Color? activeColor;
  final Color? thumbColor;

  const AppSlider({
    super.key,
    required this.value,
    this.onChanged,
    this.min = 0.0,
    this.max = 1.0,
    this.divisions,
    this.label,
    this.activeColor,
    this.thumbColor,
  });

  @override
  Widget build(BuildContext context) {
    final effectiveActiveColor = activeColor ?? AppColors.primary;
    final effectiveThumbColor = thumbColor ?? AppColors.primary;

    final platform = Theme.of(context).platform;

    if (platform == TargetPlatform.iOS || platform == TargetPlatform.macOS) {
      return CupertinoSlider(
        value: value,
        onChanged: onChanged,
        min: min,
        max: max,
        divisions: divisions,
        activeColor: effectiveActiveColor,
        thumbColor: effectiveThumbColor,
      );
    }

    return Slider(
      value: value,
      onChanged: onChanged,
      min: min,
      max: max,
      divisions: divisions,
      label: label,
      activeColor: effectiveActiveColor,
      thumbColor: effectiveThumbColor,
    );
  }
}
