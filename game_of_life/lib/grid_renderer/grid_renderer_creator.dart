import 'package:flutter/material.dart';

import '../grid/grid.dart';
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
    required super.grid,
  });

  final Color aliveCellsColor;
  final Color deadCellsColor;

  @override
  GridRenderer createRenderer() {
    return ColoredGridRenderer(
      aliveCellsColor: aliveCellsColor,
      deadCellsColor: deadCellsColor,
      grid: grid,
    );
  }
}
