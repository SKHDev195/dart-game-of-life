enum TimerTypes {
  perSecond(
    prettyName: 'Per second',
  ),
  perMinute(
    prettyName: 'Per minute',
  ),
  perHalfSecond(
    prettyName: 'Per half second',
  ),
  perQuarterSecond(
    prettyName: 'Per quarter second',
  );

  final String prettyName;

  const TimerTypes({
    required this.prettyName,
  });
}
