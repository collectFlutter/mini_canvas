import 'package:flutter/material.dart';

import 'base_widget.dart';
import '../painter/arc_painter.dart';

/// 圆弧（包括圆）
class ArcWidget extends BaseWidget {
  /// 直径
  final double diameter;

  /// 开始角度
  final double startAngle;

  /// 间隔角度
  final double sweepAngle;

  /// 圆环背景
  final Color borderColor;

  /// 中部的文字
  final String? middleLabel;

  /// 上部的文字
  final String? aboveLabel;

  /// [diameter] - 直径 <br/>
  /// [startAngle] - 开始角度 <br/>
  /// [sweepAngle] - 间隔角度 <br/>
  /// [color] - 颜色 <br/>
  /// [strokeWidth] - 画笔粗细
  const ArcWidget(
    this.diameter, {
    this.startAngle = 0.0,
    this.borderColor = Colors.grey,
    this.sweepAngle = 360.0,
    this.middleLabel,
    this.aboveLabel,
    super.color = Colors.blue,
    super.strokeWidth = 1.0,
    super.key,
  }) : super(width: diameter, height: diameter);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(diameter, diameter),
      painter: ArcPainter(
        color: color,
        startAngle: startAngle,
        sweepAngle: sweepAngle,
        strokeWidth: strokeWidth,
        borderColor: borderColor,
        middleLabel: middleLabel ?? '',
        aboveLabel: aboveLabel ?? '',
      ),
    );
  }
}
