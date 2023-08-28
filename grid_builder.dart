import 'grid_state.dart';

abstract interface class GridBuilder {
  GridBuilder._internal();

  void setInitialState(GridState state);
}
