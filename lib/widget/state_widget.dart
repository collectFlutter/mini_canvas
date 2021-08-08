import 'dart:math';

import 'package:flutter/material.dart';
import 'base_widget.dart';

import 'arc_widget.dart';
import 'five_star_widget.dart';
import 'string_widget.dart';

class StateWidget extends BaseWidget {
  final String label;
  final double fontSize;

  StateWidget(
    this.label, {
    this.fontSize = 12,
    Color color = Colors.grey,
    double size = 100,
  }) : super(width: size, height: size, color: color);

  @override
  Widget build(BuildContext context) {
    double fiveWidth = 0.08 * width * sqrt(2);
    double bigR = 0.5 * width;
    double minR = 0.35 * width;
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Container(
          width: width,
          height: height,
        ),
        ArcWidget(width, color: Colors.grey[700]!),
        ArcWidget(width * 0.7,
            startAngle: -10, sweepAngle: 110, color: Colors.grey[700]!),
        ArcWidget(width * 0.7,
            startAngle: 170, sweepAngle: 110, color: Colors.grey[700]!),
        StringWidget(label,
            rotateAngle: -45,
            fontSize: fontSize,
            color: color,
            width: width,
            height: width),
        Positioned(
            left: bigR - bigR * sin(pi * 0.1),
            top: bigR - bigR * cos(pi * 0.1),
            child: FiveStarWidget(fiveWidth, color: color)),
        Positioned(
            left: bigR - bigR * sin(pi * 0.2),
            top: bigR - bigR * cos(pi * 0.2),
            child: FiveStarWidget(fiveWidth, color: color)),
        Positioned(
            left: bigR - bigR * sin(pi * 0.3),
            top: bigR - bigR * cos(pi * 0.3),
            child: FiveStarWidget(fiveWidth, color: color)),
        Positioned(
            left: bigR - bigR * sin(pi * 0.4),
            top: bigR - bigR * cos(pi * 0.4),
            child: FiveStarWidget(fiveWidth, color: color)),
        Positioned(
            left: bigR + minR * sin(pi * 0.05),
            top: bigR + minR * cos(pi * 0.04),
            child: FiveStarWidget(fiveWidth, color: color)),
        Positioned(
            left: bigR + minR * sin(pi * 0.18),
            top: bigR + minR * cos(pi * 0.18),
            child: FiveStarWidget(fiveWidth, color: color)),
        Positioned(
            left: bigR + minR * sin(pi * 0.32),
            top: bigR + minR * cos(pi * 0.32),
            child: FiveStarWidget(fiveWidth, color: color)),
        Positioned(
            left: bigR + minR * sin(pi * 0.5),
            top: bigR + minR * cos(pi * 0.44),
            child: FiveStarWidget(fiveWidth, color: color)),
      ],
    );
  }
}
