library dotted_line_flutter;

import 'package:flutter/material.dart';

class DottedLinePainter extends CustomPainter {
  final Color color;
  final Color gapColor;
  final double lineThickness;
  final double dashGap;
  final double dashWidth;

  DottedLinePainter({
    this.color = const Color(0xffffffff),
    this.gapColor = Colors.transparent,
    this.lineThickness = 1,
    this.dashGap = 2.0,
    this.dashWidth = 2.0,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = lineThickness
      ..strokeCap = StrokeCap.round;
    double startX = 0.0;
    bool isGap = false;

    while (startX < size.width) {
      if (isGap) {
        paint.color = gapColor;
      } else {
        paint.color = color;
      }

      canvas.drawLine(
        Offset(startX, 0),
        Offset(startX + dashWidth, 0),
        paint,
      );

      startX += isGap ? dashGap : dashWidth;
      isGap = !isGap;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
