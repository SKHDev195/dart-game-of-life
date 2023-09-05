import 'dart:math';

import 'cell.dart';
import 'grid.dart';
import 'grid_state.dart';

abstract base class GridBuilder {
  GridBuilder._internal();

  Grid? _grid;
  GridState? _initialState;

  Grid get grid => _grid!;

  void createGrid(
    int rows,
    int columns,
  );

  void generateInitialState();

  void setInitialState() {
    _grid!.state = _initialState!;
    _grid!.cellsSink.add(_grid!.state!.cells);
    print('initial state added');
  }
}

final class BasicGridBuilder extends GridBuilder {
  BasicGridBuilder._internal() : super._internal();

  static BasicGridBuilder? _instance;

  factory BasicGridBuilder() => _instance ??= BasicGridBuilder._internal();

  @override
  void createGrid(
    int rows,
    int columns,
  ) {
    _grid = Grid(
      rows: rows,
      columns: columns,
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
