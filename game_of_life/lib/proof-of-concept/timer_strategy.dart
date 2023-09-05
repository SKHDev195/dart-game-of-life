import 'package:game_of_life/proof-of-concept/cell_status_calculator.dart';
import 'package:pausable_timer/pausable_timer.dart';

import 'cell.dart';
import 'grid.dart';
import 'timer_types.dart';

abstract base class TimerStrategy {
  TimerStrategy({
    required this.grid,
  });

  late PausableTimer _timer;
  PausableTimer get timer => _timer;

  Grid grid;

  void onTick();
  void onPause() => _timer.pause();
  void onResume() => _timer.start();

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
  }) : super(
          grid: grid,
        );

  @override
  void onTick() {
    print('new tick');
    List<Cell> cells = [];
    for (int i = 0; i < grid.area; i++) {
      int numberOfLiveNeighbors = grid.getLiveNeighbours(i);
      bool isAlive = CellStatusCalculator.calculateStatus(
        numberOfLiveNeighbors,
        grid.state!.cells[i].isAlive,
      );
      cells.add(
        Cell(
          index: i,
          isAlive: isAlive,
        ),
      );
    }

    grid.state = grid.state!.copyWith(
      cells: cells,
    );

    grid.cellsSink.add(
      grid.state!.cells,
    );

    timer.reset();
    timer.start();
  }
}
