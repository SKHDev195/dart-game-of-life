import 'package:game_of_life/proof-of-concept/grid_renderer.dart';

import 'grid.dart';

abstract base class GridRendererCreator {
  GridRendererCreator({
    required this.grid,
  });

  final Grid grid;

  GridRenderer createRenderer();
}

final class SquareGridRendererCreator extends GridRendererCreator {
  SquareGridRendererCreator({
    required super.grid,
  });

  @override
  GridRenderer createRenderer() {
    return SquareGridRenderer(
      grid: grid,
      stream: grid.cellsStream,
    );
  }
}
