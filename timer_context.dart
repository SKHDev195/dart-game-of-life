import 'timer_strategy.dart';

abstract class Context {
  late TimerStrategy _strategy;

  void setStrategy(
    TimerStrategy strategy,
  ) {
    _strategy = strategy;
  }

  void tick();
  void pause();
  void resume();
}

final class BasicTimerContext extends Context {

  @override
  void tick() => _strategy.onTick();

  @override
  void tick() => 
}
