final class Cell {
  Cell({
    required index,
    required this.isAlive,
  }) : _index = index;

  factory Cell.createAlive(
    int index,
  ) =>
      Cell(
        index: index,
        isAlive: true,
      );

  factory Cell.createDead(
    int index,
  ) =>
      Cell(
        index: index,
        isAlive: false,
      );

  int _index;
  int get index => _index;
  bool isAlive;
}
