import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

import 'base_painter.dart';

class ClockPainter extends BasePainter {
  final Color handColor;
  final Color numberColor;
  final Color borderColor;
  final DateTime datetime;
  final double radius;
  late double borderWidth;
  List<Offset> secondsOffset = [];
  late TextPainter textPainter;
  late double angle;

  ClockPainter(this.datetime,
      {this.radius = 150.0,
      this.handColor = Colors.black,
      this.numberColor = Colors.black,
      this.borderColor = Colors.black,
      super.color = Colors.red,
      super.strokeWidth = 1.0}) {
    borderWidth = radius / 14;

    final secondDistance = radius - borderWidth * 2;
    for (var i = 0; i < 60; i++) {
      Offset offset = Offset(
          cos(degToRad(6 * i - 90)) * secondDistance + radius,
          sin(degToRad(6 * i - 90)) * secondDistance + radius);
      secondsOffset.add(offset);
    }
    textPainter = TextPainter(
      textAlign: TextAlign.center,
      textDirection: TextDirection.rtl,
    );
    angle = degToRad(360 / 60).toDouble();
  }

  @override
  void paint(Canvas canvas, Size size) {
    final scale = radius / 150;

    //draw border
    final borderPaint = Paint()
      ..color = borderColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = borderWidth;
    canvas.drawCircle(
        Offset(radius, radius), radius - borderWidth / 2, borderPaint);

    //draw second point
    final secondPPaint = Paint()
      ..strokeWidth = 2 * scale
      ..color = numberColor;
    if (secondsOffset.isNotEmpty) {
      canvas.drawPoints(PointMode.points, secondsOffset, secondPPaint);

      canvas.save();
      canvas.translate(radius, radius);

      List<Offset> bigger = [];
      for (var i = 0; i < secondsOffset.length; i++) {
        if (i % 5 == 0) {
          bigger.add(secondsOffset[i]);

          //draw number
          canvas.save();
          canvas.translate(0.0, -radius + borderWidth * 4);
          textPainter.text = TextSpan(
            text: "${(i ~/ 5) == 0 ? "12" : (i ~/ 5)}",
            style: TextStyle(
                color: numberColor,
                fontFamily: 'Times  Roman',
                fontSize: 28.0 * scale),
          );

          canvas.rotate(-angle * i);

          textPainter.layout();
          textPainter.paint(canvas,
              Offset(-(textPainter.width / 2), -(textPainter.height / 2)));
          canvas.restore();
        }
        canvas.rotate(angle);
      }
      canvas.restore();

      final biggerPaint = Paint()
        ..strokeWidth = 5 * scale
        ..color = numberColor;
      canvas.drawPoints(PointMode.points, bigger, biggerPaint);
    }
    final hour = datetime.hour;
    final minute = datetime.minute;
    final second = datetime.second;

    // draw hour hand
    Offset hourHand1 = Offset(
        radius - cos(degToRad(360 / 12 * hour - 90)) * (radius * 0.2),
        radius - sin(degToRad(360 / 12 * hour - 90)) * (radius * 0.2));
    Offset hourHand2 = Offset(
        radius + cos(degToRad(360 / 12 * hour - 90)) * (radius * 0.5),
        radius + sin(degToRad(360 / 12 * hour - 90)) * (radius * 0.5));
    final hourPaint = Paint()
      ..color = handColor
      ..strokeWidth = 8 * scale;
    canvas.drawLine(hourHand1, hourHand2, hourPaint);

    // draw minute hand
    Offset minuteHand1 = Offset(
        radius - cos(degToRad(360 / 60 * minute - 90)) * (radius * 0.3),
        radius - sin(degToRad(360 / 60 * minute - 90)) * (radius * 0.3));
    Offset minuteHand2 = Offset(
        radius +
            cos(degToRad(360 / 60 * minute - 90)) * (radius - borderWidth * 3),
        radius +
            sin(degToRad(360 / 60 * minute - 90)) * (radius - borderWidth * 3));
    final minutePaint = Paint()
      ..color = handColor
      ..strokeWidth = 3 * scale;
    canvas.drawLine(minuteHand1, minuteHand2, minutePaint);

    // draw second hand
    Offset secondHand1 = Offset(
        radius - cos(degToRad(360 / 60 * second - 90)) * (radius * 0.3),
        radius - sin(degToRad(360 / 60 * second - 90)) * (radius * 0.3));
    Offset secondHand2 = Offset(
        radius +
            cos(degToRad(360 / 60 * second - 90)) * (radius - borderWidth * 3),
        radius +
            sin(degToRad(360 / 60 * second - 90)) * (radius - borderWidth * 3));
    final secondPaint = Paint()
      ..color = handColor
      ..strokeWidth = 1 * scale;
    canvas.drawLine(secondHand1, secondHand2, secondPaint);

    final centerPaint = Paint()
      ..strokeWidth = 2 * scale
      ..style = PaintingStyle.stroke
      ..color = Colors.yellow;
    canvas.drawCircle(Offset(radius, radius), 4 * scale, centerPaint);
  }
}
