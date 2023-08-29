import 'dart:async';

abstract base class GameTimer {
  late Timer _timer;

  void onTick();
}

final class BasicGameTimer extends GameTimer {
  factory BasicGameTimer.perSecond() => _timer = Timer();
}
