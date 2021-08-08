import 'dart:math';

import 'package:flutter/material.dart';

class CircleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double r = min(size.width, size.height) * 0.5;
    return Path()..addOval(Rect.fromCircle(center: Offset(r, r), radius: r));
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
