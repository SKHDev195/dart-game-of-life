sealed class CellStatusCalculator {
  static bool calculateStatus(int numberOfLiveNeighbors, bool currentStatus) {
    return numberOfLiveNeighbors == 3 ||
        (currentStatus && numberOfLiveNeighbors == 2);
  }
}
