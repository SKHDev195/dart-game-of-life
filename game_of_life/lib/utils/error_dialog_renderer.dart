import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:game_of_life/pages/setup_page/setup_page.dart';

import '../models/custom_error.dart';

sealed class ErrorDialogRenderer {
  static const errorTitle = 'Alert!';

  static void errorDialog(
    BuildContext context,
    CustomError e,
  ) {
    print(e.message);
    if (Platform.isIOS) {
      showCupertinoDialog(
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            title: const Text(
              errorTitle,
            ),
            content: Text(
              e.message,
            ),
            actions: [
              CupertinoDialogAction(
                child: const Text(
                  'OK',
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
              e.message,
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(
                    context,
                  );
                  Navigator.pushNamed(
                    context,
                    SetupPage.routeName,
                  );
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
