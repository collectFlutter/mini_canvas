import 'dart:math';

import 'package:flutter/material.dart';

abstract class BasePainter extends CustomPainter {
  /// 颜色
  final Color color;

  /// 需要旋转的角度
  final double rotateAngle;

  /// 画笔宽度
  final double strokeWidth;

  // 1度对应的弧度
  final double rad = pi / 180.0;

  // 画笔
  Paint customPaint;

  BasePainter(
      {this.color, this.rotateAngle, this.strokeWidth = 1, Listenable repaint})
      : super(repaint: repaint) {
    customPaint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;
  }

  /// 画布中心旋转
  void rotate(double width, double height, Canvas canvas) {
    if (rotateAngle == 0.0) return;
//    print("画布大小：$width , $height");
    // 计算画布中心轨迹圆半径
    double panelRadius = sqrt(pow(width, 2) + pow(height, 2));
    // 计算画布中心点初始弧度
    double startAngle = atan(height / width);
    // 计算画布初始中心点坐标
    Point p0 =
        Point(panelRadius * cos(startAngle), panelRadius * sin(startAngle));
    // 需要旋转的弧度
    double radian = rotateAngle * rad;
    // 计算旋转后的画布中心点坐标
    Point px = Point(panelRadius * cos(radian + startAngle),
        panelRadius * sin(radian + startAngle));

    // 先平移画布
    canvas.translate((p0.x - px.x) / 2, (p0.y - px.y) / 2);
    // 后旋转
    canvas.rotate(radian);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;

  num degToRad(num deg) => deg * (pi / 180.0);

  num radToDeg(num rad) => rad * (180.0 / pi);
}
