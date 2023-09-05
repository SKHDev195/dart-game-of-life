import 'dart:async';

import 'package:game_of_life/proof-of-concept/cell.dart';

import 'grid.dart';

abstract base class GridRenderer {
  GridRenderer({
    required this.grid,
    required this.stream,
  });
  final Grid grid;
  final Stream<List<Cell>> stream;
  late StreamSubscription subscription;

  String? deadCellRender;
  String? aliveCellRender;

  void startListening() {
    subscription = stream.listen(renderGrid);
  }

  void renderGrid(List<Cell> cells);
}

final class SquareGridRenderer extends GridRenderer {
  SquareGridRenderer({
    required super.grid,
    required super.stream,
  });

  @override
  String get deadCellRender => '□';

  @override
  String get aliveCellRender => '■';

  @override
  void renderGrid(List<Cell> cells) {
    String result = '';

    for (int row = 0; row < grid.rows; row++) {
      for (int col = 0; col < grid.columns; col++) {
        int index = row * grid.columns + col;
        Cell cell = cells[index];

        result += (cell.isAlive) ? aliveCellRender : deadCellRender;

        if (col < grid.columns - 1) {
          result += ' ';
        }
      }

      if (row < grid.rows - 1) {
        result += '\n';
      }
    }

    print(result);
  }
}
