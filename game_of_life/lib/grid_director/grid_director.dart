import 'grid_builder.dart';

abstract base class Director {
  Director._internal();

  late GridBuilder builder;

  void setBuilder(
    GridBuilder builder,
  ) {
    this.builder = builder;
  }

  void initialiseGrid({
    required int rows,
    required int columns,
  });
}

final class GridDirector extends Director {
  GridDirector._internal() : super._internal();

  static GridDirector? _instance;

  factory GridDirector() => _instance ??= GridDirector._internal();

  @override
  void initialiseGrid({
    required int rows,
    required int columns,
  }) {
    builder.createGrid(
      rows,
      columns,
    );
    builder.generateInitialState();
    builder.setInitialState();
  }
}
