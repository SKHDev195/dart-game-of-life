import 'package:pausable_timer/pausable_timer.dart';

import '../grid/grid.dart';
import 'timer_types.dart';

abstract base class TimerStrategy {
  TimerStrategy({
    required this.grid,
    required this.onTick,
  });

  final void Function() onTick;

  late PausableTimer _timer;
  PausableTimer get timer => _timer;

  Grid grid;

  void onPause() => _timer.pause();
  void onStart() => _timer.start();
  void onStop() => timer.cancel();

  void setTimer(TimerTypes timerType) {
    PausableTimer timer = switch (timerType) {
      TimerTypes.perSecond => PausableTimer(
          const Duration(seconds: 1),
          onTick,
        ),
      TimerTypes.perMinute => PausableTimer(
          const Duration(minutes: 1),
          onTick,
        ),
      TimerTypes.perHalfSecond => PausableTimer(
          const Duration(
            milliseconds: 500,
          ),
          onTick,
        ),
      TimerTypes.perQuarterSecond => PausableTimer(
          const Duration(
            milliseconds: 250,
          ),
          onTick,
        ),
    };

    _timer = timer;
  }
}

final class BasicTimerStrategy extends TimerStrategy {
  BasicTimerStrategy({
    required grid,
    required onTick,
  }) : super(
          grid: grid,
          onTick: onTick,
        );
}
