import 'grid_state.dart';

abstract base class PlayingField {
  PlayingField._internal();
}

final class Grid extends PlayingField {
  static Grid? _instance;
  Grid._internal(
    int rows,
    int columns,
    GridState state,
  )   : rows = rows,
        columns = columns,
        state = state,
        super._internal() {
    _instance = this;
  }

  factory Grid(int rows, int columns, GridState state) =>
      _instance ??= Grid._internal(
        rows,
        columns,
        state,
      );

  final int rows;
  final int columns;
  GridState state;
}
