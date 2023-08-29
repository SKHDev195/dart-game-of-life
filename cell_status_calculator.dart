abstract interface class StatusCalculator {
  StatusCalculator._internal();

  bool calculateStatus(
    int numberOfLiveNeighbors,
    bool currentStatus,
  );
}

final class CellStatusCalculator extends StatusCalculator {
  CellStatusCalculator._internal() : super._internal();
  static CellStatusCalculator? _instance;

  factory CellStatusCalculator() =>
      _instance ??= CellStatusCalculator._internal();

  @override
  bool calculateStatus(int numberOfLiveNeighbors, bool currentStatus) {
    return numberOfLiveNeighbors == 3 ||
        (currentStatus && numberOfLiveNeighbors == 2);
  }
}
