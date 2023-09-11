import 'dart:ui';

import 'package:flutter/material.dart';
import 'base_painter.dart';

class PointPainter extends BasePainter {
  final List<Offset> points;

  PointPainter(
    this.points, {
    super.color = Colors.red,
    super.strokeWidth = 1.0,
  });

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawPoints(PointMode.points, points, customPaint..strokeWidth = 3);
  }
}
