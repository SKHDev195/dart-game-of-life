import 'dart:math';

import 'cell.dart';
import 'grid.dart';
import 'grid_state.dart';

abstract base class GridBuilder {
  GridBuilder._internal();

  Grid? _grid;
  GridState? _initialState;

  void createGrid(
    int rows,
    int columns,
  );

  void generateInitialState();

  void setInitialState() {
    _grid!.state == _initialState!;
  }
}

final class BasicGridBuilder extends GridBuilder {
  static BasicGridBuilder? _instance;
  BasicGridBuilder._internal() : super._internal();

  factory BasicGridBuilder() => _instance ??= BasicGridBuilder._internal();

  @override
  void createGrid(
    int rows,
    int columns,
  ) {
    _grid = Grid(
      rows,
      columns,
    );
  }

  @override
  void generateInitialState() {
    GridState result = GridState(
      cells: [],
    );
    Random random = Random();

    for (int i = 0; i < _grid!.area; i++) {
      bool isAlive = random.nextInt(5) == 4;
      result.cells.add(
        Cell(
          index: i,
          isAlive: isAlive,
        ),
      );
    }

    _initialState = result;
  }
}
