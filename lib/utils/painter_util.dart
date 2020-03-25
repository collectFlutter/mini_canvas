import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// 1度对应的弧度
final double rad = pi / 180.0;

/// 绘制工具
class PainterUtil {
  /// 绘制线段
  static void paintLine(
    Canvas canvas,
    double startX,
    double endX, {
    Offset center = const Offset(0, 0),
    Color color = Colors.red,
    double rotateAngle = 0,
    double strokeWidth = 1,
  }) {
    canvas.save();
    canvas.translate(center.dx, center.dy);
    canvas.rotate(rotateAngle * rad);
    canvas.drawLine(
        Offset(startX, 0),
        Offset(endX, 0),
        Paint()
          ..color = color
          ..strokeCap = StrokeCap.round
          ..style = PaintingStyle.stroke
          ..strokeWidth = strokeWidth);
    canvas.restore();
  }

  /// 绘制五角星<br/>
  /// [center] 中心点 <br/>
  /// [radius] 外接圆半径 <br/>
  /// [color] 文本颜色 <br/>
  /// [rotateAngle] 旋转角度 <br/>
  static void paintFiveStart(
    Canvas canvas,
    Offset center,
    double radius, {
    Color color = Colors.red,
    double rotateAngle = 0,
  }) {
    Offset p1 = Offset(0, -radius);
    Offset p2 = Offset(radius * sin(pi * 0.4), -radius * cos(pi * 0.4));
    Offset p3 = Offset(radius * sin(pi * 0.2), radius * cos(pi * 0.2));
    Offset p4 = Offset(-radius * sin(pi * 0.2), radius * cos(pi * 0.2));
    Offset p5 = Offset(-radius * sin(pi * 0.4), -radius * cos(pi * 0.4));
    Path path = Path();
    path.moveTo(p1.dx, p1.dy);
    path.lineTo(p3.dx, p3.dy);
    path.lineTo(p5.dx, p5.dy);
    path.lineTo(p2.dx, p2.dy);
    path.lineTo(p4.dx, p4.dy);
    path.lineTo(p1.dx, p1.dy);

    canvas.save();
    canvas.translate(center.dx, center.dy);
    canvas.rotate(-rotateAngle);
    // 绘制五角星
    canvas.drawPath(
        path,
        Paint()
          ..color = color
          ..style = PaintingStyle.fill);
    // 恢复画布到上一个save状态
    canvas.restore();
  }

  /// 绘制字符串 <br/>
  /// [point] 绘制中点 <br/>
  /// [text] 显示文本 <br/>
  /// [fontSize] 文本大小 <br/>
  /// [color] 文本颜色 <br/>
  /// [rotateAngle] 旋转角度 <br/>
  static void paintString(
    Canvas canvas,
    Offset point,
    String text, {
    double fontSize = 12,
    Color color = Colors.black,
    double rotateAngle = 0,
  }) {
    TextPainter textPainter = TextPainter(textAlign: TextAlign.center, textDirection: TextDirection.rtl);

    // 绘制标题
    textPainter.text =
        TextSpan(text: text, style: TextStyle(color: color, fontFamily: 'Times New Roman', fontSize: fontSize));
    textPainter.layout();
    canvas.save();
    canvas.rotate(-rotateAngle);
    textPainter.paint(canvas, Offset(point.dx - textPainter.width * 0.5, point.dy - textPainter.height * 0.5));
    canvas.restore();
  }

  /// 绘制圆弧<br/>
  /// [center] 圆心坐标<br/>
  /// [radius] 半径<br/>
  /// [startAngle] 开始角度 <br/>
  /// [sweepAngle] 间隔角度 <br/>
  /// [color] 画笔颜色 <br/>
  /// [strokeWidth] 画笔宽度<br/>
  static void paintArc(
    Canvas canvas,
    Offset center,
    double radius, {
    double startAngle = 0.0,
    double sweepAngle = 360.0,
    Color color = Colors.blue,
    double strokeWidth = 1,
  }) {
    Rect rect = Rect.fromCircle(center: center, radius: radius);
    canvas.drawArc(
      rect,
      startAngle * rad,
      sweepAngle * rad,
      false,
      Paint()
        ..color = color
        ..strokeCap = StrokeCap.round
        ..strokeWidth = strokeWidth
        ..style = PaintingStyle.stroke,
    );
  }

}
