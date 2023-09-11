import 'dart:ui';

import 'package:flutter/material.dart';
import '../timer/timer_context.dart';
import '../widgets/colored_grid.dart';

import '../grid/grid.dart';

abstract base class GridRenderer {
  GridRenderer({
    required this.grid,
    required this.timerContext,
  });
  final Grid grid;
  final TimerContext timerContext;

  double getSize();

  Widget renderGrid();
}

final class ColoredGridRenderer extends GridRenderer {
  ColoredGridRenderer({
    required this.aliveCellsColor,
    required this.deadCellsColor,
    required super.grid,
    required super.timerContext,
  }) : super();

  final Color aliveCellsColor;
  final Color deadCellsColor;

  @override
  double getSize() {
    FlutterView view = PlatformDispatcher.instance.views.first;
    double permittedWidth = (view.physicalSize.width - 20) / grid.columns;
    double permittedHeight = (view.physicalSize.height - 20) / grid.rows;

    double result =
        (permittedWidth > permittedHeight) ? permittedHeight : permittedWidth;

    return result;
  }

  @override
  Widget renderGrid() {
    final cellSize = getSize();
    return ColoredGrid(
      rows: grid.rows,
      columns: grid.columns,
      cells: grid.state!.cells,
      aliveCellsColor: aliveCellsColor,
      deadCellsColor: deadCellsColor,
      cellSize: cellSize,
    );
  }
}
