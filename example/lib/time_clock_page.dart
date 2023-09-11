import 'dart:async';

import 'package:flutter/material.dart';

// ignore: depend_on_referenced_packages
import 'package:mini_canvas/mini_canvas.dart';

class TimeClockPage extends StatefulWidget {
  const TimeClockPage({super.key});

  @override
  State createState() => _TimeClockPageState();
}

class _TimeClockPageState extends State<TimeClockPage> {
  late DateTime datetime;
  late Timer timer;

  @override
  void initState() {
    super.initState();
    datetime = DateTime.now();
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      datetime = DateTime.now();
      if (mounted) setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return ClockWidget(
      datetime,
      height: MediaQuery.of(context).size.width,
      width: MediaQuery.of(context).size.width,
    );
  }
}
