import 'timer_strategy.dart';

abstract class TimerContext {
  late TimerStrategy strategy;

  void setStrategy(
    TimerStrategy strategy,
  ) {
    this.strategy = strategy;
  }

  void pause();
  void resume();
}

final class BasicTimerContext extends TimerContext {
  @override
  void pause() => strategy.onPause();

  @override
  void resume() => strategy.onResume();
}
