import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../../../core_ui.dart';

class AppTimePicker {
  static Future<TimeOfDay?> show({
    required BuildContext context,
    required TimeOfDay initialTime,
  }) async {
    final platform = Theme.of(context).platform;

    if (platform == TargetPlatform.iOS || platform == TargetPlatform.macOS) {
      TimeOfDay? pickedTime = initialTime;
      await showCupertinoModalPopup<void>(
        context: context,
        builder: (BuildContext context) => Container(
          height: 216,
          padding: const EdgeInsets.only(top: 6.0),
          margin: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          color: CupertinoColors.systemBackground.resolveFrom(context),
          child: SafeArea(
            top: false,
            child: CupertinoDatePicker(
              initialDateTime: DateTime(
                2020,
                1,
                1,
                initialTime.hour,
                initialTime.minute,
              ),
              mode: CupertinoDatePickerMode.time,
              use24hFormat: true,
              onDateTimeChanged: (DateTime newDate) {
                pickedTime = TimeOfDay.fromDateTime(newDate);
              },
            ),
          ),
        ),
      );
      return pickedTime;
    } else {
      return await showTimePicker(
        context: context,
        initialTime: initialTime,
        builder: (context, child) {
          return Theme(
            data: Theme.of(context).copyWith(
              colorScheme: ColorScheme.light(
                primary: AppColors.primary,
                onPrimary: AppColors.onPrimary,
                surface: AppColors.surface,
                onSurface: AppColors.onSurface,
              ),
            ),
            child: child!,
          );
        },
      );
    }
  }
}
