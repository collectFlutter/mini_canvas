import 'package:flutter/material.dart';
import '../painter/dash_board_painter.dart';

import 'base_widget.dart';

class BashBoardWidget extends BaseWidget {
  /// 直径
  final double diameter;

  /// 刻度值[0-100]
  final double value;

  /// 指标名称(最多4个字)
  final String label;

  ///右侧颜色值
  final Color rightColor;

  BashBoardWidget(this.diameter,
      {this.value = 0.0,
      this.rightColor = Colors.blueAccent,
      this.label = '',
      Color color = Colors.transparent,
      double strokeWidth = 10.0})
      : super(
            color: color,
            width: diameter,
            height: diameter,
            strokeWidth: strokeWidth);
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(diameter, diameter),
      painter: DashBoardPainter(
          leftColor: color,
          strokeWidth: strokeWidth,
          label: label,
          value: value,
          rightColor: rightColor),
    );
  }
}
