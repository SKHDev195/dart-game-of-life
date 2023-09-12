import 'timer_strategy.dart';

abstract class TimerContext {
  late TimerStrategy strategy;

  void setStrategy(
    TimerStrategy strategy,
  ) {
    this.strategy = strategy;
  }

  void pause();
  void start();
  void stop();
}

final class BasicTimerContext extends TimerContext {
  @override
  void pause() => strategy.onPause();

  @override
  void start() => strategy.onStart();

  @override
  void stop() => strategy.onStop();
}
