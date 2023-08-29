import 'grid_state.dart';

abstract base class PlayingField {
  PlayingField._internal();
}

final class Grid extends PlayingField {
  static Grid? _instance;
  Grid._internal(
    int rows,
    int columns,
  )   : rows = rows,
        columns = columns,
        super._internal() {
    _instance = this;
  }

  int get area => rows * columns;

  factory Grid(
    int rows,
    int columns,
  ) =>
      _instance ??= Grid._internal(
        rows,
        columns,
      );

  final int rows;
  final int columns;
  late GridState? state;
}
