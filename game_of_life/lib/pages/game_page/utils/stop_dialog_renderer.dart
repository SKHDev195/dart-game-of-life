import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:game_of_life/pages/setup_page/setup_page.dart';

sealed class StopDialogRenderer {
  static const title = 'Warning';
  static const content = 'Do you want to stop the game and go back to setup?';

  static void errorDialog(
    BuildContext context,
  ) {
    if (Platform.isIOS) {
      showCupertinoDialog(
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            title: const Text(
              title,
            ),
            content: const Text(
              content,
            ),
            actions: [
              CupertinoDialogAction(
                child: const Text(
                  'YES',
                ),
                onPressed: () {
                  Navigator.pop(
                    context,
                  );
                  Navigator.pushNamed(
                    context,
                    SetupPage.routeName,
                  );
                },
              ),
              CupertinoDialogAction(
                child: const Text(
                  'NO',
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
              title,
            ),
            content: const Text(
              content,
            ),
            actions: [
              TextButton(
                onPressed: () {
                  if (Navigator.canPop(context)) {
                    Navigator.pop(
                      context,
                    );
                  }
                },
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
