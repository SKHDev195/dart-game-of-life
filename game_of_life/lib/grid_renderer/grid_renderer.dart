import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';

import '../cell/cell.dart';
import '../grid/grid.dart';

abstract base class GridRenderer {
  GridRenderer({
    required this.grid,
  });
  final Grid grid;

  Widget? deadCellRender;
  Widget? aliveCellRender;

  Widget renderGrid(List<Cell> cells);
}

final class ColoredGridRenderer extends GridRenderer {
  // double getSide() {
  //   FlutterView view = PlatformDispatcher.instance.views.first;
  //   double width = view.physicalSize.width;
  //   double height = view.physicalSize.height;

  //   double resultWidth = (width - 20) / ((grid.rows - 1) * 3);
  // }
}
