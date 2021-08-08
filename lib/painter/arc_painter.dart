import 'dart:math';

import 'package:flutter/material.dart';
import '../utils/painter_util.dart';

/// 绘制弧线（默认是圆）
class ArcPainter extends CustomPainter {
  /// 颜色
  final Color color;

  /// 画笔宽度
  final double strokeWidth;

  /// 开始角度
  final double startAngle;

  /// 间隔角度
  final double sweepAngle;

  /// 中部的文字
  final String middleLabel;

  /// 上部的文字
  final String aboveLabel;

  /// 圆环背景色
  final Color borderColor;

  /// 默认是画圆
  ArcPainter(
      {this.startAngle = 0.0,
      this.sweepAngle = 360.0,
      this.color = Colors.blue,
      this.middleLabel = '',
      this.aboveLabel = '',
      this.borderColor = Colors.transparent,
      this.strokeWidth = 1});

  @override
  void paint(Canvas canvas, Size size) {
    Offset _center = Offset(size.width * 0.5, size.height * 0.5);
    double _radius = min(size.width, size.height) * 0.5 - strokeWidth * 0.5;
    final scale = _radius / 75;
    PainterUtil.paintArc(canvas, _center, _radius,
        color: borderColor, strokeWidth: strokeWidth);

    PainterUtil.paintArc(canvas, _center, _radius,
        startAngle: startAngle,
        sweepAngle: sweepAngle,
        color: color,
        strokeWidth: strokeWidth);
    PainterUtil.paintString(
        canvas, Offset(size.width * 0.5, size.height * 0.5 * 1.15), middleLabel,
        fontSize: 16 * scale);
    PainterUtil.paintString(
        canvas, Offset(size.width * 0.5, size.height * 0.5 * 0.85), aboveLabel,
        fontSize: 12 * scale, color: Colors.grey);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
