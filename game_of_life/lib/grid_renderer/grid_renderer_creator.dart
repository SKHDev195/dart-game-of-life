import '../grid/grid.dart';
import 'grid_renderer.dart';

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
