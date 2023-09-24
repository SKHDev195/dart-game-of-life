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
  ),
  perTenthOfASecond(
    prettyName: 'Per tenth of a second',
  );

  final String prettyName;

  const TimerTypes({
    required this.prettyName,
  });
}
