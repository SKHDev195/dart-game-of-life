import 'package:equatable/equatable.dart';

import '../cell/cell.dart';

final class GridState extends Equatable {
  const GridState({
    required this.cells,
  });

  final List<Cell> cells;

  @override
  List<Object?> get props => [
        cells,
      ];

  GridState copyWith({List<Cell>? cells}) {
    return GridState(
      cells: cells ?? this.cells,
    );
  }
}
