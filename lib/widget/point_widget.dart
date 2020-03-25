import 'package:flutter/material.dart';
import '../painter/point_painter.dart';
import 'base_widget.dart';

class PointWidget extends BaseWidget {
  final List<Offset> points;

  /// [points] - 点集合 <br/>
  /// [color] - 颜色 <br/>
  /// [width] - 画布宽度<br/>
  /// [height] - 画布宽度<br/>
  /// [strokeWidth] - 画笔粗细
  PointWidget(this.points,
      {Color color = Colors.blue,
      double width = 50,
      double height = 50,
      double strokeWidth = 1.0})
      : super(
            color: color,
            height: height,
            width: width,
            strokeWidth: strokeWidth);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: PointPainter(points),
      size: Size(width, height),
    );
  }
}
