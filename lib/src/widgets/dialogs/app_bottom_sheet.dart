import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../../../core_ui.dart';

class AppBottomSheet {
  static Future<T?> show<T>({
    required BuildContext context,
    required Widget child,
    bool isDismissible = true,
  }) {
    final platform = Theme.of(context).platform;

    if (platform == TargetPlatform.iOS || platform == TargetPlatform.macOS) {
      return showCupertinoModalPopup<T>(
        context: context,
        builder: (context) => CupertinoActionSheet(
          message: child,
          actions: [
            CupertinoActionSheetAction(
              onPressed: () => Navigator.pop(context),
              isDestructiveAction: true,
              child: const Text('Cancel'),
            ),
          ],
        ),
        // Note: CupertinoActionSheet is specific.
        // For a generic bottom sheet on iOS, usually showModalBottomSheet is still used
        // or a custom Cupertino container.
        // If we want a truly custom content sheet on iOS, we might just use the Material one
        // but with iOS styling?
        // Let's fallback to Material's showModalBottomSheet for custom content
        // as IOS "ActionSheet" is very specific to options/actions.
      );
    }

    // Better implementation for "Generic Bottom Sheet":
    return showModalBottomSheet<T>(
      context: context,
      isDismissible: isDismissible,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(AppRadius.xl)),
      ),
      builder: (context) => Padding(
        padding: MediaQuery.of(context).viewInsets, // Handle keyboard
        child: child,
      ),
    );
  }
}
