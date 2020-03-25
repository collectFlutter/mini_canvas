import 'dart:math';

import 'package:flutter/material.dart';

class WaveProgressPainter extends CustomPainter {
  Animation<double> _animation;
  Color borderColor, fillColor;
  double _progress;

  WaveProgressPainter(this._animation, this.borderColor, this.fillColor, this._progress) : super(repaint: _animation);

  @override
  void paint(Canvas canvas, Size size) {
//    print(_animation.value);
    // draw small wave
    Paint wave2Paint = new Paint()..color = fillColor.withOpacity(0.5);
    double p = _progress / 100.0;
    double n = 4.2;
    double amp = 4.0;
    double baseHeight = (1 - p) * size.height;

    Path path = Path();
    path.moveTo(0.0, baseHeight);
    for (double i = 0.0; i < size.width; i++) {
      path.lineTo(i, baseHeight + sin((i / size.width * 2 * pi * n) + (_animation.value * 2 * pi) + pi * 1) * amp);
    }

    path.lineTo(size.width, size.height);
    path.lineTo(0.0, size.height);
    path.close();
    canvas.drawPath(path, wave2Paint);

    // draw big wave
    Paint wave1Paint = new Paint()..color = fillColor;
    n = 2.2;
    amp = 10.0;

    path = Path();
    path.moveTo(0.0, baseHeight);
    for (double i = 0.0; i < size.width; i++) {
      path.lineTo(i, baseHeight + sin((i / size.width * 2 * pi * n) + (_animation.value * 2 * pi)) * amp);
    }

    path.lineTo(size.width, size.height);
    path.lineTo(0.0, size.height);
    path.close();
//    canvas.drawPath(path, wave1Paint);

    // draw border
    Paint borderPaint = new Paint()
      ..color = borderColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10.0;

//    canvas.drawCircle(size.center(Offset.zero), size.width / 2, borderPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
