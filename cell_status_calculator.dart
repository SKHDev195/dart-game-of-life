abstract interface class StatusCalculator {
  bool calculateStatus(
    int numberOfLiveNeighbors,
    bool currentStatus,
  );
}

final class CellStatusCalculator implements StatusCalculator {
  CellStatusCalculator._internal();
  static CellStatusCalculator? _instance;

  factory CellStatusCalculator() =>
      _instance ??= CellStatusCalculator._internal();

  @override
  bool calculateStatus(int numberOfLiveNeighbors, bool currentStatus) {
    return numberOfLiveNeighbors == 3 ||
        (currentStatus && numberOfLiveNeighbors == 2);
  }
}
