import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import '../utils/painter_util.dart';

class DashBoardPainter extends CustomPainter {
  /// 第一个颜色
  final Color leftColor;

  /// 第二个颜色
  final Color rightColor;

  /// 画笔宽度
  final double strokeWidth;

  /// 刻度值[0-100]
  final double value;

  /// 指标名称(最多4个字)
  final String label;

  /// 间隔度数
  final double angle = 24;

  DashBoardPainter(
      {this.value = 0,
      this.rightColor = Colors.pink,
      this.leftColor = Colors.blue,
      this.strokeWidth = 1,
      this.label = '指标名称'});

  @override
  void paint(Canvas canvas, Size size) {
    final double radius = min(size.width, size.height) * 0.5 - strokeWidth;
    final scale = radius / 75;
    Color endColor = leftColor;
    Offset center = Offset(size.width * 0.5, size.height * 0.5);
    canvas.save();
    canvas.translate(center.dx, center.dy);
    PainterUtil.paintArc(canvas, Offset(0, 0), radius,
        startAngle: 150,
        sweepAngle: 240,
        color: Colors.grey,
        strokeWidth: strokeWidth);
    int index = 0;
    while (true) {
      endColor = Color.lerp(leftColor, rightColor, index * 0.01) ?? rightColor;
      double startAngle = 150 + index * 2.4;
      double sweepAngle = min(2.4, 2.40 * value - index * 2.4);
      PainterUtil.paintArc(canvas, Offset(0, 0), radius,
          startAngle: startAngle,
          sweepAngle: sweepAngle,
          color: endColor,
          strokeWidth: strokeWidth);
      if (index > value || ++index == 100) {
        break;
      }
    }
    // 绘制圆点
    PainterUtil.paintArc(canvas, Offset(0, 0), 4 * scale,
        color: endColor, strokeWidth: 2 * scale);
    // 绘制指针
    PainterUtil.paintLine(canvas, 4 * scale, radius - strokeWidth - 20 * scale,
        strokeWidth: 2 * scale,
        color: endColor,
        rotateAngle: angle * value > 2400 ? 395 : angle * value * 0.1 + 150);

    // 绘制刻度
    List.generate(11, (index) {
      PainterUtil.paintArc(
          canvas,
          Offset(
            (radius - strokeWidth * 0.5) * cos((150 + angle * index) * rad),
            (radius - strokeWidth * 0.5) * sin((150 + angle * index) * rad),
          ),
          1,
          color: index <= value * 0.1
              ? (Color.lerp(leftColor, rightColor, index * 0.1) ?? leftColor)
              : Colors.grey,
          strokeWidth: scale);
      PainterUtil.paintString(
          canvas,
          Offset(
            (radius - strokeWidth - 5 * scale) *
                cos((150 + angle * index) * rad),
            (radius - strokeWidth - 5 * scale) *
                sin((150 + angle * index) * rad),
          ),
          "$index",
          color: Colors.black,
          fontSize: 12.0 * scale);
    });

    /// 绘制标签
    PainterUtil.paintString(canvas, Offset(0, radius * 0.3), label,
        color: Colors.grey, fontSize: 14.0 * scale);

    /// 绘制百分比文字
    PainterUtil.paintString(
        canvas, Offset(0, radius * 0.6), "${value.toStringAsFixed(2)}%",
        color: Colors.black, fontSize: 22.0 * scale);
    canvas.restore();
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
