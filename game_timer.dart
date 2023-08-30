import 'dart:async';

abstract base class GameTimer {
  GameTimer._internal();
  late Timer _timer;

  static void onTick() {}
}

final class BasicGameTimer extends GameTimer {
  factory BasicGameTimer.perSecond() => _timer = Timer(
        const Duration(seconds: 5),
        onTick,
      );

  @override
  static void onTick() {}
}
