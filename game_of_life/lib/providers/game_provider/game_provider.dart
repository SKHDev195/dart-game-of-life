import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:game_of_life/repositories/game_repository.dart';
import 'package:state_notifier/state_notifier.dart';

import '../../grid_renderer/grid_renderer.dart';
import '../../models/custom_error.dart';

part 'game_state.dart';

final class GameProvider extends StateNotifier<GameState> with LocatorMixin {
  GameProvider()
      : super(
          GameState.initial(),
        );

  late GridRenderer gridRenderer;

  void assignGridRenderer({
    required GridRenderer gridRenderer,
  }) {
    try {
      read<GameRepository>().setRenderer(
        gridRenderer: gridRenderer,
      );
      this.gridRenderer = gridRenderer;
      state = state.copyWith(
        gameStatus: GameStatus.loaded,
      );
    } on CustomError catch (e) {
      state = state.copyWith(
        gameStatus: GameStatus.error,
        customError: e,
      );
      rethrow;
    }
  }

  Widget displayGrid(
    BuildContext context,
  ) {
    try {
      Widget grid = read<GameRepository>().gridRenderer.renderGrid(
            context,
          );
      return grid;
    } on CustomError catch (e) {
      state = state.copyWith(
        gameStatus: GameStatus.error,
        customError: e,
      );
      rethrow;
    }
  }

  void reactToTimerError(
    CustomError e,
  ) {
    state = state.copyWith(
      gameStatus: GameStatus.error,
      customError: e,
    );
  }
}
