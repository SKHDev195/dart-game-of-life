import 'grid_builder.dart';

abstract base class GridDirector {
  GridDirector({
    required this.builder,
  });
  GridBuilder builder;

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
