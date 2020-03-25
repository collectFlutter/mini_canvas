import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mini_canvas/mini_canvas.dart';

class TimeClockPage extends StatefulWidget {
  @override
  _TimeClockPageState createState() => _TimeClockPageState();
}

class _TimeClockPageState extends State<TimeClockPage> {
  DateTime datetime;
  Timer timer;
  @override
  void initState() {
    super.initState();
    datetime = DateTime.now();
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
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
