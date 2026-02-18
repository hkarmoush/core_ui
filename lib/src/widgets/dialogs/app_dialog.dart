import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../../../core_ui.dart';

class AppDialog extends StatelessWidget {
  final String title;
  final String content;
  final List<Widget> actions;

  const AppDialog({
    super.key,
    required this.title,
    required this.content,
    required this.actions,
  });

  static Future<T?> show<T>({
    required BuildContext context,
    required String title,
    required String content,
    required List<Widget> actions,
  }) {
    final platform = Theme.of(context).platform;

    if (platform == TargetPlatform.iOS || platform == TargetPlatform.macOS) {
      return showCupertinoDialog<T>(
        context: context,
        builder: (context) => CupertinoAlertDialog(
          title: Text(title),
          content: Text(content),
          actions: actions,
        ),
      );
    } else {
      return showDialog<T>(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(title),
          content: Text(content),
          actions: actions,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppRadius.lg),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final platform = Theme.of(context).platform;

    if (platform == TargetPlatform.iOS || platform == TargetPlatform.macOS) {
      return CupertinoAlertDialog(
        title: Text(title),
        content: Text(content),
        actions: actions,
      );
    } else {
      return AlertDialog(
        title: Text(title),
        content: Text(content),
        actions: actions,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadius.lg),
        ),
      );
    }
  }
}
