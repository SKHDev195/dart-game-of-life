import 'package:equatable/equatable.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:game_of_life/grid_director/grid_builder.dart';
import 'package:game_of_life/repositories/grid_repository.dart';

import '../../models/custom_error.dart';
import '../../timer/timer_types.dart';

part 'setup_state.dart';

final class SetupProvider extends StateNotifier<SetupState> with LocatorMixin {
  SetupProvider()
      : super(
          SetupState.initial(),
        );

  void setupGrid({
    required TimerTypes timerType,
    required int rows,
    required int columns,
  }) {
    state = state.copyWith(
      setupStatus: SetupStatus.submitting,
    );

    try {
      GridBuilder gridBuilder = BasicGridBuilder();
      read<GridRepository>().createNewGrid(
        gridBuilder: gridBuilder,
        timerType: timerType,
        rows: rows,
        columns: columns,
      );
      state = state.copyWith(
        setupStatus: SetupStatus.success,
      );
    } on CustomError {
      state = state.copyWith(
        setupStatus: SetupStatus.error,
      );
      rethrow;
    }
  }
}
