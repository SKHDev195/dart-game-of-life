abstract base class TimerStrategy {
  void onTick();
  void onPause();
  void onResume();
}

final class BasicTimerStrategy extends TimerStrategy {
  @override
  void onPause() {
    // TODO: implement onPause
  }

  @override
  void onResume() {
    // TODO: implement onResume
  }

  @override
  void onTick() {
    // TODO: implement onTick
  }
}
