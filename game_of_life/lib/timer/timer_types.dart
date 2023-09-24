enum TimerTypes {
  perMinute(
    prettyName: 'Timer: one tick per minute',
  ),
  perSecond(
    prettyName: 'Timer: one tick per second',
  ),
  perHalfSecond(
    prettyName: 'Timer: one tick per half second',
  ),
  perQuarterSecond(
    prettyName: 'Timer: one tick per quarter of a second',
  ),
  perTenthOfASecond(
    prettyName: 'Timer: one tick per tenth of a second',
  );

  final String prettyName;

  const TimerTypes({
    required this.prettyName,
  });
}
