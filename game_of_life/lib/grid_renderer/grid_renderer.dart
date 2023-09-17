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

  double getSize(BuildContext context);

  Widget renderGrid(BuildContext context);
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
  double getSize(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final aspectRatio = width / height;

    final widthOffset = (aspectRatio < 1) ? 60 : 300;
    final heightOffset = (aspectRatio > 1) ? 60 : 300;

    double permittedWidth = (width - widthOffset) / grid.columns;
    double permittedHeight = (height - heightOffset) / grid.rows;

    double result =
        (permittedWidth > permittedHeight) ? permittedHeight : permittedWidth;

    return result;
  }

  @override
  Widget renderGrid(BuildContext context) {
    final cellSize = getSize(context);
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