import 'package:game_of_life/grid_renderer/grid_renderer.dart';
import 'package:game_of_life/models/custom_error.dart';

final class GameRepository {
  late GridRenderer gridRenderer;

  void setRenderer({
    required GridRenderer gridRenderer,
  }) {
    try {
      this.gridRenderer = gridRenderer;
    } on Exception {
      throw const CustomError(
        message: 'An error has occured',
      );
    }
  }
}
