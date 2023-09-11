import 'dart:math';

import 'package:flutter/material.dart';
import '../utils/painter_util.dart';

/// 绘制五角星
class FiveStarPainter extends CustomPainter {
  /// 颜色
  final Color color;

  /// 需要旋转的角度
  final double rotateAngle;

  FiveStarPainter({this.color = Colors.red, this.rotateAngle = 0.0});

  @override
  void paint(Canvas canvas, Size size) {
    final double radius = min(size.width, size.height) * 0.5;
    PainterUtil.paintFiveStart(
      canvas,
      Offset(size.width * 0.5, size.height * 0.5),
      radius,
      color: color,
      rotateAngle: rotateAngle,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
