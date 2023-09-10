import 'package:game_of_life/grid_director/grid_builder.dart';
import 'package:game_of_life/models/custom_error.dart';
import 'package:game_of_life/timer/timer_strategy.dart';

import '../grid/grid.dart';
import '../grid_director/grid_director.dart';
import '../grid_renderer/grid_renderer.dart';
import '../grid_renderer/grid_renderer_creator.dart';
import '../timer/timer_context.dart';
import '../timer/timer_types.dart';

final class GridRepository {
  GridRepository({
    required this.gridDirector,
    required this.timerType,
    required this.gridRendererCreator,
  });

  final GridDirector gridDirector;
  final TimerTypes timerType;
  final GridRendererCreator gridRendererCreator;

  Grid createNewGrid({
    required GridBuilder gridBuilder,
    required TimerTypes timerType,
    required int rows,
    required int columns,
  }) {
    try {
      gridDirector.setBuilder(
        gridBuilder,
      );
      gridDirector.initialiseGrid(
        rows: rows,
        columns: columns,
      );
      TimerStrategy timerStrategy = BasicTimerStrategy(
        grid: gridDirector.builder.grid,
      )..setTimer(
          timerType,
        );
      TimerContext timerContext = BasicTimerContext()
        ..setStrategy(
          timerStrategy,
        );

      GridRenderer gridRenderer = gridRendererCreator.createRenderer();
      return gridDirector.builder.grid;
    } catch (e) {
      throw const CustomError(
        message: 'An error has occured',
      );
    }
  }
}
