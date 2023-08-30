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
}
