import 'package:game_of_life/grid_director/grid_builder.dart';
import 'package:game_of_life/models/custom_error.dart';
import 'package:game_of_life/timer/timer_strategy.dart';

import '../grid/grid.dart';
import '../grid_director/grid_director.dart';
import '../grid_renderer/grid_renderer.dart';
import '../grid_renderer/grid_renderer_creator.dart';
import '../timer/timer_context.dart';

final class GridRepository {
  GridRepository({
    required this.gridDirector,
    required this.timerContext,
    required this.gridRendererCreator,
  });

  final GridDirector gridDirector;
  final TimerContext timerContext;
  final GridRendererCreator gridRendererCreator;

  Grid createNewGrid({
    required GridBuilder gridBuilder,
    required TimerStrategy timerStrategy,
    required int rows,
    required int columns,
  }) {
    try {
      gridDirector.setBuilder(
        gridBuilder,
      );
      gridDirector.initialiseGrid(
        rows,
        columns,
      );
      timerContext.setStrategy(timerStrategy);
      GridRenderer gridRenderer = gridRendererCreator.createRenderer();
      return gridDirector.builder.grid;
    } catch (e) {
      throw const CustomError(
        message: 'An error has occured',
      );
    }
  }
}
