import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';

/// A decorative grid background with subtle square boxes
/// Creates a modern tech aesthetic for portfolio screens
class GridBackground extends StatelessWidget {
  const GridBackground({
    super.key,
    this.gridSize = 50.0,
    this.lineColor,
    this.lineWidth = 1.0,
    this.opacity = 0.05,
  });

  /// Size of each grid square
  final double gridSize;

  /// Color of the grid lines (defaults to textSecondary)
  final Color? lineColor;

  /// Width of the grid lines
  final double lineWidth;

  /// Opacity of the grid lines
  final double opacity;

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: CustomPaint(
        painter: _GridPainter(
          gridSize: gridSize,
          lineColor:
              (lineColor ?? AppColors.textSecondary).withOpacity(opacity),
          lineWidth: lineWidth,
        ),
      ),
    );
  }
}

class _GridPainter extends CustomPainter {
  _GridPainter({
    required this.gridSize,
    required this.lineColor,
    required this.lineWidth,
  });

  final double gridSize;
  final Color lineColor;
  final double lineWidth;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = lineColor
      ..strokeWidth = lineWidth
      ..style = PaintingStyle.stroke;

    // Draw vertical lines
    for (double x = 0; x <= size.width; x += gridSize) {
      canvas.drawLine(
        Offset(x, 0),
        Offset(x, size.height),
        paint,
      );
    }

    // Draw horizontal lines
    for (double y = 0; y <= size.height; y += gridSize) {
      canvas.drawLine(
        Offset(0, y),
        Offset(size.width, y),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant _GridPainter oldDelegate) {
    return oldDelegate.gridSize != gridSize ||
        oldDelegate.lineColor != lineColor ||
        oldDelegate.lineWidth != lineWidth;
  }
}
