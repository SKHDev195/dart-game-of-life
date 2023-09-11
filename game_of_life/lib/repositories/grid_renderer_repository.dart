import 'package:flutter/material.dart';
import 'package:game_of_life/grid_director/grid_builder.dart';
import 'package:game_of_life/models/custom_error.dart';
import 'package:game_of_life/timer/timer_strategy.dart';

import '../grid_director/grid_director.dart';
import '../grid_renderer/grid_renderer.dart';
import '../grid_renderer/grid_renderer_creator.dart';
import '../timer/timer_context.dart';
import '../timer/timer_types.dart';

final class GridRendererRepository {
  final gridBuilder = BasicGridBuilder();
  final gridDirector = GridDirector();

  GridRenderer createNewGridRenderer({
    required TimerTypes timerType,
    required int rows,
    required int columns,
    required Color aliveCellsColor,
    required Color deadCellsColor,
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

      final gridRendererCreator = ColoredGridRenderedCreator(
        aliveCellsColor: aliveCellsColor,
        deadCellsColor: deadCellsColor,
        grid: gridDirector.builder.grid,
        timerContext: timerContext,
      );
      return gridRendererCreator.createRenderer();
    } catch (e) {
      throw const CustomError(
        message: 'An error has occured',
      );
    }
  }
}
