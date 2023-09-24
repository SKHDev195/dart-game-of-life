import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:game_of_life/pages/setup_page/setup_page.dart';

sealed class StopDialogRenderer {
  static const title = 'Warning';
  static const content = 'Do you want to stop the game and go back to setup?';

  static void stopDialog(
    BuildContext context,
    void Function()? onPressed,
  ) {
    if (Platform.isIOS) {
      showCupertinoDialog(
        context: context,
        builder: (
          context,
        ) {
          return CupertinoAlertDialog(
            title: const Text(
              title,
            ),
            content: const Text(
              content,
            ),
            actions: [
              CupertinoDialogAction(
                onPressed: () => Navigator.pop(
                  context,
                ),
                child: const Text(
                  'NO',
                ),
              ),
              CupertinoDialogAction(
                onPressed: onPressed,
                child: const Text(
                  'YES',
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
              title,
            ),
            content: const Text(
              content,
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(
                  context,
                ),
                child: const Text(
                  'NO',
                ),
              ),
              TextButton(
                onPressed: onPressed,
                child: const Text(
                  'YES',
                ),
              ),
            ],
          );
        },
      );
    }
  }
}
