import 'package:game_of_life/grid_renderer/grid_renderer.dart';

final class GameRepository {
  late GridRenderer gridRenderer;

  void setRenderer({
    required GridRenderer gridRenderer,
  }) {
    this.gridRenderer = gridRenderer;
  }
}
