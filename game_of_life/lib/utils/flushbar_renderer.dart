import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';

sealed class FlushbarRenderer {
  static const activeDuration = Duration(
    seconds: 2,
  );
  static const position = FlushbarPosition.TOP;

  static Widget showPausedFlushbar(
    BuildContext context,
  ) =>
      Flushbar(
        message: 'Game is paused!',
        isDismissible: true,
        duration: activeDuration,
        flushbarPosition: position,
      )..show(context);

  static Widget showOnHoldFlushbar(
    BuildContext context,
  ) =>
      Flushbar(
        message: 'Game is on hold!',
        isDismissible: true,
        duration: activeDuration,
        flushbarPosition: position,
      )..show(context);

  static Widget showGoingFlushbar(
    BuildContext context,
  ) =>
      Flushbar(
        message: 'Game is going!',
        isDismissible: true,
        duration: activeDuration,
        flushbarPosition: position,
      )..show(context);
}
