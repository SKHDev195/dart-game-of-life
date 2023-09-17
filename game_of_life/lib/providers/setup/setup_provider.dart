import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:game_of_life/repositories/grid_renderer_repository.dart';

import '../../grid_renderer/grid_renderer.dart';
import '../../models/custom_error.dart';
import '../../timer/timer_types.dart';

part 'setup_state.dart';

final class SetupProvider extends StateNotifier<SetupState> with LocatorMixin {
  SetupProvider()
      : super(
          SetupState.initial(),
        );

  GridRenderer setupGridRenderer({
    required TimerTypes timerType,
    required int rows,
    required int columns,
    required Color aliveCellsColor,
    required Color deadCellsColor,
  }) {
    state = state.copyWith(
      setupStatus: SetupStatus.submitting,
    );

    try {
      final gridRenderer = read<GridRendererRepository>().createNewGridRenderer(
        timerType: timerType,
        rows: rows,
        columns: columns,
        aliveCellsColor: aliveCellsColor,
        deadCellsColor: deadCellsColor,
      );
      state = state.copyWith(
        setupStatus: SetupStatus.success,
      );

      return gridRenderer;
    } on CustomError {
      state = state.copyWith(
        setupStatus: SetupStatus.error,
      );
      rethrow;
    }
  }
}
