import 'package:flutter/cupertino.dart';
import 'package:p2p_test/ui/core/ui_exporter.dart';
import 'dart:io';

class DialogUtil {
  static Future<void> showAlertDialog({
    required BuildContext context,
    required String title,
    required String message,
    required String positiveText,
    required VoidCallback onPositive,
    VoidCallback onNegative = _emptyFunction,
    String? negativeText,
  }) async {
    if (Platform.isIOS) {
      return showCupertinoDialog(
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            title: Text(title),
            content: Text(message),
            actions: [
              if (negativeText != null)...[
                CupertinoDialogAction(
                  onPressed: () => {
                    onNegative(),
                    Navigator.of(context).pop()
                  },
                  child: Text(
                    negativeText,
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              ],
              CupertinoDialogAction(
                onPressed: () => {
                  onPositive(),
                  Navigator.of(context).pop()
                },
                child: Text(positiveText),
              ),
            ],
          );
        },
      );
    } else {
      return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(title),
            content: Text(message),
            actions: [
              TextButton(
                onPressed: onPositive,
                child: Text(positiveText),
              ),
              if (negativeText != null)
                TextButton(
                  onPressed: onNegative,
                  child: Text(negativeText),
                ),
            ],
          );
        },
      );
    }
  }

  static void _emptyFunction() {}
}
