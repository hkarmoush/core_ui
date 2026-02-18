import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../../../core_ui.dart';

class AppSegmentedControl<T extends Object> extends StatelessWidget {
  final Map<T, Widget> children;
  final T? groupValue;
  final ValueChanged<T?> onValueChanged;
  final Color? selectedColor;
  final Color? unselectedColor;
  final Color? borderColor;

  const AppSegmentedControl({
    super.key,
    required this.children,
    required this.groupValue,
    required this.onValueChanged,
    this.selectedColor,
    this.unselectedColor,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    final platform = Theme.of(context).platform;

    if (platform == TargetPlatform.iOS || platform == TargetPlatform.macOS) {
      return CupertinoSegmentedControl<T>(
        children: children,
        groupValue: groupValue,
        onValueChanged: (T value) {
          onValueChanged(value);
        },
        selectedColor: selectedColor ?? AppColors.primary,
        unselectedColor: unselectedColor ?? AppColors.surface,
        borderColor: borderColor ?? AppColors.primary,
      );
    }

    // Material equivalent (SegmentedButton is Material 3, but requires a Set<T>)
    // For simplicity mapping to ToggleButtons or SegmentedButton.
    // SegmentedButton is the modern M3 replacement.

    return SegmentedButton<T>(
      segments: children.entries.map((entry) {
        return ButtonSegment<T>(value: entry.key, label: entry.value);
      }).toList(),
      selected: groupValue != null ? {groupValue!} : {},
      onSelectionChanged: (Set<T> newSelection) {
        if (newSelection.isNotEmpty) {
          onValueChanged(newSelection.first);
        }
      },
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.resolveWith<Color?>((
          Set<WidgetState> states,
        ) {
          if (states.contains(WidgetState.selected)) {
            return selectedColor ?? AppColors.primary.withValues(alpha: 0.2);
          }
          return unselectedColor; // null means default
        }),
      ),
    );
  }
}
