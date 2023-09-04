import 'dart:async';
import 'dart:io';

import 'grid_builder.dart';
import 'grid_director.dart';
import 'grid_renderer_creator.dart';
import 'timer_context.dart';
import 'timer_strategy.dart';
import 'timer_types.dart';

import 'grid_renderer.dart';

void main() async {
  GridBuilder gridBuilder = BasicGridBuilder();
  Director gridDirector = GridDirector()
    ..setBuilder(
      gridBuilder,
    );

  gridDirector.initialiseGrid(
    20,
    20,
  );

  TimerStrategy timerStrategy = BasicTimerStrategy(
    grid: gridDirector.builder.grid,
  )..setTimer(
      TimerTypes.perQuarterSecond,
    );

  TimerContext timerContext = BasicTimerContext()
    ..setStrategy(
      timerStrategy,
    );

  timerContext.strategy.timer.start();

  GridRendererCreator gridRendererCreator = SquareGridRendererCreator(
    grid: gridDirector.builder.grid,
  );

  GridRenderer gridRenderer = gridRendererCreator.createRenderer();
  gridRenderer.startListening();
}
