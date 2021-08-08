import 'dart:math';

import 'package:flutter/material.dart';
import '../painter/clock_painter.dart';

import 'base_widget.dart';

/// 时钟
class ClockWidget extends BaseWidget {
  final Color handColor;
  final Color numberColor;
  final Color borderColor;
  final DateTime datetime;

  /// [diameter] - 直径 <br/>
  /// [startAngle] - 开始角度 <br/>
  /// [sweepAngle] - 间隔角度 <br/>
  /// [color] - 颜色 <br/>
  /// [strokeWidth] - 画笔粗细
  ClockWidget(
    this.datetime, {
    this.handColor = Colors.black,
    this.numberColor = Colors.black,
    this.borderColor = Colors.black,
    Color color = Colors.blue,
    double strokeWidth = 1.0,
    double width = 100,
    double height = 100,
  }) : super(
            color: color,
            width: width,
            height: height,
            strokeWidth: strokeWidth);

  @override
  Widget build(BuildContext context) {
    double radius = min(width, height) * 0.5;
    return CustomPaint(
      size: Size(width, width),
      painter: ClockPainter(datetime,
          radius: radius,
          handColor: handColor,
          numberColor: numberColor,
          borderColor: borderColor,
          color: color,
          strokeWidth: strokeWidth),
    );
  }
}
