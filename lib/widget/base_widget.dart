import 'package:flutter/material.dart';

abstract class BaseWidget extends StatelessWidget {
  /// 颜色
  final Color color;

  /// 需要旋转的角度
  final double rotateAngle;

  /// 高度
  final double height;

  /// 宽度
  final double width;

  /// 画笔宽度
  final double strokeWidth;

  const BaseWidget(
      {Key? key,
      this.color = Colors.blue,
      this.rotateAngle = 0.0,
      this.height = 50,
      this.width = 50,
      this.strokeWidth = 1})
      : super(key: key);
}
