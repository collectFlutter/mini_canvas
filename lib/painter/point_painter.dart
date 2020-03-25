import 'dart:ui';

import 'package:flutter/material.dart';
import 'base_painter.dart';

class PointPainter extends BasePainter {
  final List<Offset> points;

  PointPainter(this.points,
      {Color color = Colors.red, double strokeWidth = 1.0})
      : super(color: color, strokeWidth: strokeWidth);

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawPoints(PointMode.points, points, customPaint..strokeWidth = 3);
  }
}
