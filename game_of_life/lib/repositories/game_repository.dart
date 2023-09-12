import 'package:game_of_life/grid_renderer/grid_renderer.dart';

import '../models/custom_error.dart';

class GameRepository {
  late GridRenderer gridRenderer;

  void setRenderer({
    required GridRenderer gridRenderer,
  }) {
    gridRenderer = gridRenderer;
  }

  void pause() {
    try {
      gridRenderer.timerContext.pause();
    } catch (e) {
      throw const CustomError(
        message: 'Game could not be stopped!',
      );
    }
  }

  void start() {
    try {
      gridRenderer.timerContext.start();
    } catch (e) {
      throw const CustomError(
        message: 'Game could not be started!',
      );
    }
  }

  void stop() {
    try {
      gridRenderer.timerContext.stop();
    } catch (e) {
      throw const CustomError(
        message: 'Game could not be stopped!',
      );
    }
  }
}
