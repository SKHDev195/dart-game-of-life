import 'package:equatable/equatable.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:game_of_life/grid_director/grid_builder.dart';
import 'package:game_of_life/repositories/grid_repository.dart';
import 'package:game_of_life/timer/timer_strategy.dart';

import '../../models/custom_error.dart';

part 'setup_state.dart';

final class SetupProvider extends StateNotifier<SetupState> with LocatorMixin {
  SetupProvider()
      : super(
          SetupState.initial(),
        );

  void setupGrid({
    required GridBuilder gridBuilder,
    required TimerStrategy timerStrategy,
    required int rows,
    required int columns,
  }) {
    state = state.copyWith(
      setupStatus: SetupStatus.submitting,
    );

    try {
      read<GridRepository>().createNewGrid(
        gridBuilder: gridBuilder,
        timerStrategy: timerStrategy,
        rows: rows,
        columns: columns,
      );
      state = state.copyWith(
        setupStatus: SetupStatus.success,
      );
    } on CustomError catch (e) {
      state = state.copyWith(
        setupStatus: SetupStatus.error,
      );
      rethrow;
    }
  }
}
