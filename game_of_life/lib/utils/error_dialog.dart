import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../models/custom_error.dart';

sealed class ErrorDialogRenderer {
  static const errorTitle = 'An error has occured';

  static void errorDialog(BuildContext context, CustomError e) {
    if (Platform.isIOS) {
      showCupertinoDialog(
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            title: const Text(
              errorTitle,
            ),
            content: Text(
              '$e.message',
            ),
            actions: [
              CupertinoDialogAction(
                child: const Text(
                  'OK',
                ),
                onPressed: () => Navigator.pop(
                  context,
                ),
              ),
            ],
          );
        },
      );
    } else {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text(
              errorTitle,
            ),
            content: Text(
              '$e.message',
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(
                  context,
                ),
                child: const Text(
                  'OK',
                ),
              ),
            ],
          );
        },
      );
    }
  }
}
