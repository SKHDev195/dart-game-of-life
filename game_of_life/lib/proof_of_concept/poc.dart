import '../grid_director/grid_builder.dart';
import '../grid_director/grid_director.dart';
import '../grid_renderer/grid_renderer.dart';
import '../grid_renderer/grid_renderer_creator.dart';
import '../timer/timer_context.dart';
import '../timer/timer_strategy.dart';
import '../timer/timer_types.dart';

void main() async {
  GridBuilder gridBuilder = BasicGridBuilder();
  Director gridDirector = GridDirector()
    ..setBuilder(
      gridBuilder,
    );

  gridDirector.initialiseGrid(
    30,
    30,
  );

  TimerStrategy timerStrategy = BasicTimerStrategy(
    grid: gridDirector.builder.grid,
  )..setTimer(
      TimerTypes.perQuarterSecond,
    );

  TimerContext timerContext = BasicTimerContext()
    ..setStrategy(
      timerStrategy,
    );

  timerContext.strategy.timer.start();

  GridRendererCreator gridRendererCreator = SquareGridRendererCreator(
    grid: gridDirector.builder.grid,
  );

  GridRenderer gridRenderer = gridRendererCreator.createRenderer();
  gridRenderer.startListening();
}
