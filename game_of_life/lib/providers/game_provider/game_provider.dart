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
    } on CustomError {
      state = state.copyWith(
        gameStatus: GameStatus.error,
      );
      rethrow;
    }
  }

  Widget displayGrid(BuildContext context) {
    try {
      Widget grid = read<GameRepository>().gridRenderer.renderGrid(context);
      state = state.copyWith(
        gameStatus: GameStatus.initial,
      );
      return grid;
    } on CustomError {
      state = state.copyWith(
        gameStatus: GameStatus.error,
      );
      rethrow;
    }
  }

  void pause() {
    try {
      read<GameRepository>().pause();
      state = state.copyWith(
        gameStatus: GameStatus.paused,
      );
    } on CustomError {
      state = state.copyWith(
        gameStatus: GameStatus.error,
      );
      rethrow;
    }
  }

  void start() {
    try {
      read<GameRepository>().start();
      state = state.copyWith(
        gameStatus: GameStatus.ongoing,
      );
    } on CustomError {
      state = state.copyWith(
        gameStatus: GameStatus.error,
      );
      rethrow;
    }
  }

  void stop() {
    try {
      read<GameRepository>().stop();
      state = state.copyWith(
        gameStatus: GameStatus.stopped,
      );
    } on CustomError {
      state = state.copyWith(
        gameStatus: GameStatus.error,
      );
      rethrow;
    }
  }

  void refresh() {
    state = state.copyWith(
      gameStatus: GameStatus.ongoing,
    );
  }
}
