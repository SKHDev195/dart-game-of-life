import 'package:equatable/equatable.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:game_of_life/providers/game_provider/game_provider.dart';
import 'package:game_of_life/timer/timer_strategy.dart';
import 'package:game_of_life/timer/timer_types.dart';

import '../../cell/cell.dart';
import '../../grid/grid.dart';
import '../../models/custom_error.dart';
import '../../timer/timer_context.dart';
import '../../utils/cell_status_calculator.dart';

part 'timer_context_state.dart';

final class TimerContextProvider extends StateNotifier<TimerContextState>
    with LocatorMixin {
  TimerContextProvider()
      : super(
          TimerContextState.initial(),
        );

  late TimerContext timerContext;

  void createContext(
    TimerTypes timerTypes,
    Grid grid,
  ) {
    try {
      timerContext = BasicTimerContext()
        ..setStrategy(
          BasicTimerStrategy(
            grid: grid,
            onTick: onTick,
          )..setTimer(
              timerTypes,
            ),
        );
    } on Exception {
      const e = CustomError(
        message: 'An error has occured',
      );
      read<GameProvider>().reactToTimerError(e);
      state = state.copyWith(
        timerContextStatus: TimerContextStatus.error,
        customError: e,
      );
    }
  }

  void start() {
    try {
      state = state.copyWith(
        timerContextStatus: TimerContextStatus.ticking,
      );
      timerContext.strategy.onStart();
    } on Exception {
      const e = CustomError(
        message: 'An error has occured',
      );
      read<GameProvider>().reactToTimerError(e);
      state = state.copyWith(
        timerContextStatus: TimerContextStatus.error,
        customError: e,
      );
    }
  }

  void pause() {
    try {
      state = state.copyWith(
        timerContextStatus: TimerContextStatus.paused,
      );
      timerContext.strategy.onPause();
    } on Exception {
      const e = CustomError(
        message: 'An error has occured',
      );
      read<GameProvider>().reactToTimerError(e);
      state = state.copyWith(
        timerContextStatus: TimerContextStatus.error,
        customError: e,
      );
    }
  }

  void stop() {
    try {
      state = state.copyWith(
        timerContextStatus: TimerContextStatus.stopped,
      );
      timerContext.strategy.onStop();
    } on Exception {
      const e = CustomError(
        message: 'An error has occured',
      );
      read<GameProvider>().reactToTimerError(e);
      state = state.copyWith(
        timerContextStatus: TimerContextStatus.error,
        customError: e,
      );
    }
  }

  void onTick() {
    Grid grid = timerContext.strategy.grid;
    try {
      List<Cell> newCells = [];
      for (int i = 0; i < grid.area; i++) {
        int numberOfLiveNeighbors = grid.getLiveNeighbours(i);
        bool isAlive = CellStatusCalculator.calculateStatus(
          numberOfLiveNeighbors,
          grid.state!.cells[i].isAlive,
        );
        newCells.add(
          Cell(
            index: i,
            isAlive: isAlive,
          ),
        );
      }

      grid.state = grid.state!.copyWith(
        cells: newCells,
      );

      state = state.copyWith(
        timerContextStatus: TimerContextStatus.ticking,
      );

      timerContext.strategy.timer.reset();
      timerContext.strategy.timer.start();
    } on Exception {
      const e = CustomError(
        message: 'An error has occured',
      );
      read<GameProvider>().reactToTimerError(
        e,
      );
      state = state.copyWith(
        timerContextStatus: TimerContextStatus.error,
        customError: e,
      );
    }
  }
}
