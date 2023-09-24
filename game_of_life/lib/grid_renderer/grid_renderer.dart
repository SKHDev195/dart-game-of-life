import 'package:flutter/material.dart';
import '../models/custom_error.dart';
import '../widgets/colored_grid.dart';

import '../grid/grid.dart';

abstract base class GridRenderer {
  GridRenderer({
    required this.grid,
  });
  Grid grid;

  double getSize(BuildContext context);

  Widget renderGrid(BuildContext context);
}

final class ColoredGridRenderer extends GridRenderer {
  ColoredGridRenderer({
    required this.aliveCellsColor,
    required this.deadCellsColor,
    required super.grid,
  }) : super();

  final Color aliveCellsColor;
  final Color deadCellsColor;

  @override
  double getSize(
    BuildContext context,
  ) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final aspectRatio = width / height;

    final widthPaddingMin = width * 0.05;
    final widthPaddingMax = width * 0.12;
    final heightPaddingMin = height * 0.35;
    final heightPaddingMax = height * 0.45;

    final widthOffset = (aspectRatio < 1) ? widthPaddingMax : widthPaddingMin;
    final heightOffset =
        (aspectRatio > 1) ? heightPaddingMax : heightPaddingMin;

    double permittedWidth = (width - widthOffset) / grid.columns;
    double permittedHeight = (height - heightOffset) / grid.rows;

    double result =
        (permittedWidth > permittedHeight) ? permittedHeight : permittedWidth;

    return result;
  }

  @override
  Widget renderGrid(BuildContext context) {
    try {
      final cellSize = getSize(context);
      return ColoredGrid(
        rows: grid.rows,
        columns: grid.columns,
        cells: grid.state!.cells,
        aliveCellsColor: aliveCellsColor,
        deadCellsColor: deadCellsColor,
        cellSize: cellSize,
      );
    } on Exception {
      throw const CustomError(
        message: 'An error has occured',
      );
    }
  }
}
