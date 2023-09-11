import 'dart:math';

import 'package:flutter/material.dart';
import '../utils/painter_util.dart';

/// 圆环
class PingPainter extends CustomPainter {
  /// 颜色
  final Color color;

  /// 画笔宽度
  final double strokeWidth;

  /// 开始角度
  final double startAngle;

  /// 间隔角度
  final double sweepAngle;

  /// 默认是画圆
  PingPainter(
      {this.startAngle = 0.0,
      this.sweepAngle = 360.0,
      this.color = Colors.blue,
      this.strokeWidth = 1});

  @override
  void paint(Canvas canvas, Size size) {
    Offset center = Offset(size.width * 0.5, size.height * 0.5);
    double radius = min(size.width, size.height) * 0.5;

    PainterUtil.paintArc(
      canvas,
      center,
      radius,
      startAngle: startAngle,
      sweepAngle: sweepAngle,
      color: color,
      strokeWidth: strokeWidth,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
