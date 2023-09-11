import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import '../enums/vertical_align.dart';
import 'base_painter.dart';

class StringPainter extends BasePainter {
  final String text;
  final double fontSize;

  /// 左右对齐方式
  final TextAlign horizontalTextAlign;

  /// 上下对齐方式
  final VerticalAlign verticalTextAlign;

  StringPainter(
    this.text, {
    super.color = Colors.black,
    super.rotateAngle = 0.0,
    this.horizontalTextAlign = TextAlign.center,
    this.verticalTextAlign = VerticalAlign.center,
    this.fontSize = 12,
  });

  @override
  void paint(Canvas canvas, Size size) {
    ui.ParagraphBuilder pb = ui.ParagraphBuilder(ui.ParagraphStyle(
      textAlign: horizontalTextAlign,
      fontWeight: FontWeight.w300,
      fontStyle: FontStyle.normal,
      fontSize: fontSize,
    ));
    pb.pushStyle(ui.TextStyle(color: color));
    pb.addText(text);

    ui.ParagraphConstraints pc = ui.ParagraphConstraints(width: size.width);
    //这里需要先layout, 后面才能获取到文字高度
    ui.Paragraph paragraph = pb.build()..layout(pc);
    //文字居中显示
    Offset offset = Offset(0.0, size.width * 0.5 - paragraph.height * 0.5);
    if (verticalTextAlign == VerticalAlign.top) {
      offset = Offset(0.0, 0.0);
    } else if (verticalTextAlign == VerticalAlign.bottom) {
      offset = Offset(0.0, size.width - paragraph.height);
    }
    canvas.save();
    rotate(size.width, size.height, canvas);
    canvas.drawParagraph(paragraph, offset);
    canvas.restore();
  }
}
