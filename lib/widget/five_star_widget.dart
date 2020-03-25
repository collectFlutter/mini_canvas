import 'package:flutter/material.dart';

import 'base_widget.dart';
import '../painter/five_star_painter.dart';

/// 五角星
class FiveStarWidget extends BaseWidget {
  /// 五角星大小
  final double diameter;

  /// [diameter] - 五角星直径 <br/>
  /// [color] - 颜色 <br/>
  /// [rotateAngle] - 旋转角度<br/>
  /// [strokeWidth] - 画笔粗细
  /// [strokeWidth] - 画笔粗细
  FiveStarWidget(this.diameter,
      {Color color = Colors.red,
      double rotateAngle = 0.0,
      double strokeWidth = 1.0})
      : super(
            color: color,
            rotateAngle: rotateAngle,
            width: diameter,
            height: diameter,
            strokeWidth: strokeWidth);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(diameter, diameter),
      painter: FiveStarPainter(color: color, rotateAngle: rotateAngle),
    );
  }
}
