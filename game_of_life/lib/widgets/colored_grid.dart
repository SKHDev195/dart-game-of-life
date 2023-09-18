import 'package:flutter/material.dart';

import '../cell/cell.dart';

final class ColoredGrid extends StatelessWidget {
  const ColoredGrid({
    super.key,
    required this.rows,
    required this.columns,
    required this.cells,
    required this.aliveCellsColor,
    required this.deadCellsColor,
    required this.cellSize,
  });

  final int rows;
  final int columns;
  final List<Cell> cells;
  final Color aliveCellsColor;
  final Color deadCellsColor;
  final double cellSize;

  @override
  Widget build(BuildContext context) {
    List<Color> cellColors = [];

    for (Cell cell in cells) {
      cellColors.add(
        (cell.isAlive) ? aliveCellsColor : deadCellsColor,
      );
    }

    return CustomPaint(
      size: Size(
        columns * cellSize,
        rows * cellSize,
      ),
      painter: GridPainter(
        rows,
        columns,
        cellSize,
        cellColors,
      ),
    );
  }
}

class GridPainter extends CustomPainter {
  final int rows;
  final int columns;
  final double cellSize;
  final List<Color> cellColors;

  GridPainter(
    this.rows,
    this.columns,
    this.cellSize,
    this.cellColors,
  );

  @override
  void paint(Canvas canvas, Size size) {
    for (int row = 0; row < rows; row++) {
      for (int col = 0; col < columns; col++) {
        final rect = Rect.fromPoints(
          Offset(
            col * cellSize,
            row * cellSize,
          ),
          Offset(
            (col + 1) * cellSize,
            (row + 1) * cellSize,
          ),
        );
        final paint = Paint()
          ..color = cellColors[row * columns + col]
          ..style = PaintingStyle.fill;
        canvas.drawRect(
          rect,
          paint,
        );
      }
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
