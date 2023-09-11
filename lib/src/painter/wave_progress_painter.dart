import 'dart:math';

import 'package:flutter/material.dart';
import '../utils/painter_util.dart';

class WaveProgressPainter extends CustomPainter {
  /// 动画控制
  final Animation<double> _animation;

  /// 边框颜色
  final Color borderColor;

  /// 填充颜色
  final Color fillColor;

  /// 进度[0-100]
  final double _progress;

  /// 显示标签
  final String label;

  /// 下部文字
  final String subLabel;

  WaveProgressPainter(
    this._animation,
    this._progress, {
    this.label = '',
    this.subLabel = '',
    this.borderColor = Colors.blueAccent,
    this.fillColor = Colors.blueAccent,
  }) : super(repaint: _animation);

  @override
  void paint(Canvas canvas, Size size) {
    double r = min(size.height, size.width) * 0.5;
    final scale = r / 50;
    Offset center = Offset(r, r);
    canvas.save();
    canvas.translate(center.dx, center.dy);

    double _pDy = r - _progress * 0.02 * r;
    Path path = Path()..lineTo(-r, r);
    Path path2 = Path()..lineTo(-r, r);
    for (double i = -r; i <= r; i++) {
      path.lineTo(i, _pDy + 4 * sin(i * pi * 0.02 + _animation.value * 2 * pi));
      path2.lineTo(
          i, _pDy + 4 * cos(i * pi * 0.02 + _animation.value * 2 * pi));
    }
    path
      ..lineTo(r, r)
      ..lineTo(-r, r)
      ..close();
    path2
      ..lineTo(r, r)
      ..lineTo(-r, r)
      ..close();
    canvas.drawPath(path2, Paint()..color = fillColor.withOpacity(0.5));
    canvas.drawPath(path, Paint()..color = fillColor);

    PainterUtil.paintString(canvas, Offset(0, -r * 0.3), label,
        fontSize: 8 * scale, color: Colors.grey[400]!);
    PainterUtil.paintString(canvas, Offset(0, 0), "${_progress.toInt()}%",
        fontSize: 14 * scale);
    PainterUtil.paintString(canvas, Offset(0, r * 0.3), subLabel,
        fontSize: 8 * scale, color: Colors.grey[400]!);
    canvas.restore();

    // 绘制外圆
    Paint borderPaint = new Paint()
      ..color = borderColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3.0;

    canvas.drawCircle(center, r - 1.5, borderPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
