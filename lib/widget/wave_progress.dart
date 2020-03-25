
import 'package:flutter/material.dart';
import '../painter/wave_progress_painter.dart';
import '../clipper/circle_clipper.dart';

class WaveProgress extends StatefulWidget {
  final double size;
  final Color borderColor, fillColor;
  final double progress;

  /// 显示标签
  final String label;

  /// 下部文字
  final String subLabel;

  WaveProgress(
    this.size,
    this.progress, {
    this.borderColor = Colors.blueAccent,
    this.fillColor = Colors.blueAccent,
    this.label,
    this.subLabel,
  });

  @override
  WaveProgressState createState() => WaveProgressState();
}

class WaveProgressState extends State<WaveProgress> with TickerProviderStateMixin {
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this, duration: Duration(milliseconds: 2500));
    controller.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: CircleClipper(),
      child: CustomPaint(
        size: Size(widget.size, widget.size),
        painter: WaveProgressPainter(
          controller,
          widget.progress,
          label: widget.label,
          subLabel: widget.subLabel,
          borderColor: widget.borderColor,
          fillColor: widget.fillColor,
        ),
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
