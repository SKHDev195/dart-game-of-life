import 'package:flutter/material.dart';

import '../grid/grid.dart';
import '../timer/timer_context.dart';
import 'grid_renderer.dart';

abstract base class GridRendererCreator {
  GridRendererCreator({
    required this.grid,
  });

  final Grid grid;

  GridRenderer createRenderer();
}

final class ColoredGridRenderedCreator extends GridRendererCreator {
  ColoredGridRenderedCreator({
    required this.aliveCellsColor,
    required this.deadCellsColor,
    required this.timerContext,
    required super.grid,
  });

  final Color aliveCellsColor;
  final Color deadCellsColor;
  final TimerContext timerContext;

  @override
  GridRenderer createRenderer() {
    return ColoredGridRenderer(
      aliveCellsColor: aliveCellsColor,
      deadCellsColor: deadCellsColor,
      grid: grid,
      timerContext: timerContext,
    );
  }
}
