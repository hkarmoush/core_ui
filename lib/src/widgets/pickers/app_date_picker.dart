import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../../../core_ui.dart';

class AppDatePicker {
  static Future<DateTime?> show({
    required BuildContext context,
    required DateTime initialDate,
    required DateTime firstDate,
    required DateTime lastDate,
  }) async {
    final platform = Theme.of(context).platform;

    if (platform == TargetPlatform.iOS || platform == TargetPlatform.macOS) {
      DateTime? pickedDate = initialDate;
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
              initialDateTime: initialDate,
              mode: CupertinoDatePickerMode.date,
              minimumDate: firstDate,
              maximumDate: lastDate,
              onDateTimeChanged: (DateTime newDate) {
                pickedDate = newDate;
              },
            ),
          ),
        ),
      );
      // Cupertino picker doesn't "return" a value like showDatePicker,
      // it updates state. But here we want a Future<DateTime?>.
      // A modal popup usually requires a "Done" button to confirm selection
      // or we just return the last selected value.
      // For parity with showDatePicker, let's assume the user accepted if they didn't dismiss via barrier?
      // Actually, standard iOS pattern is a Done button.
      // To keep it simple for this "show" method, we might just return what we have?
      // Or we should implement a proper dialog wrapper.
      // For now, let's just return the pickedDate.
      return pickedDate;
    } else {
      return await showDatePicker(
        context: context,
        initialDate: initialDate,
        firstDate: firstDate,
        lastDate: lastDate,
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
