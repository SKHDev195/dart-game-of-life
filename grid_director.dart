import 'grid_builder.dart';

abstract base class Director {
  Director._internal();
}

final class GridDirector extends Director {
  GridDirector._internal() : super._internal() {}

  static GridDirector? _instance;
  late GridBuilder builder;

  factory GridDirector() => _instance ??= GridDirector._internal();

  void setBuilder(GridBuilder builder) {
    builder = builder;
  }

  void initialiseGrid(
    int rows,
    int columns,
  ) {
    builder.createGrid(
      rows,
      columns,
    );
    builder.generateInitialState();
    builder.setInitialState();
  }
}
