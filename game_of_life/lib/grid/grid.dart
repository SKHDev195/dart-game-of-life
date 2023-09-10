import 'grid_state.dart';

abstract base class PlayingField {}

final class Grid extends PlayingField {
  Grid({
    required this.rows,
    required this.columns,
  });

  int get area => rows * columns;

  final int rows;
  final int columns;
  late GridState? state;

  int getLiveNeighbours(int index) {
    int rowIndex = index ~/ columns;
    int colIndex = index % columns;

    int liveNeighborCount = 0;

    List<int> rowOffsets = [-1, -1, -1, 0, 0, 1, 1, 1];
    List<int> colOffsets = [-1, 0, 1, -1, 1, -1, 0, 1];

    for (int i = 0; i < 8; i++) {
      int neighborRow = rowIndex + rowOffsets[i];
      int neighborCol = colIndex + colOffsets[i];

      if (neighborRow >= 0 &&
          neighborRow < rows &&
          neighborCol >= 0 &&
          neighborCol < columns) {
        int neighborIndex = neighborRow * columns + neighborCol;
        if (state!.cells[neighborIndex].isAlive) {
          liveNeighborCount++;
        }
      }
    }

    return liveNeighborCount;
  }
}
