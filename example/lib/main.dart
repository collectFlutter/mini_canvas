import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'time_clock_page.dart';

import 'package:mini_canvas/mini_canvas.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(home: MyHomePage());
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Widget> items = [];
  @override
  Widget build(BuildContext context) {
    items.clear();
    initWaveProgress();
    initBashBoarWidget();
    initClockWidget();
    initArcWidgets();
    initFiveWidgets();
    initStateWidgets();
    initStringWidget();
    return Scaffold(
        appBar: AppBar(title: Text("MiniCanvas 测试页面")),
        backgroundColor: Colors.grey[300],
        body: SingleChildScrollView(
          child: Column(children: items),
        ));
  }

  void initWaveProgress() {
    items.add(_buildItem(
        "波浪进度",
        ListView(
          children: <Widget>[
            WaveProgress(
              100,
              20,
              label: '空置面积剩余',
              subLabel: '5000㎡',
            ),
            WaveProgress(
              300,
              20,
              label: '进度',
            ),
            WaveProgress(
              MediaQuery.of(context).size.width,
              70,
              label: '出勤率',
            ),
          ],
        )));
  }

  void initBashBoarWidget() {
    items.add(_buildItem(
        "仪表盘",
        ListView(
          children: <Widget>[
            BashBoardWidget(100, strokeWidth: 8, label: '收缴率', value: 68.23),
            BashBoardWidget(300, strokeWidth: 10, label: '出勤率', value: 100),
            BashBoardWidget(MediaQuery.of(context).size.width, strokeWidth: 20, label: '出租率', value: 35.33),
          ],
        )));
  }

  void initClockWidget() {
    items.add(_buildItem("时钟", TimeClockPage()));
  }

  void initStringWidget() {
    items.add(_buildItem(
        "旋转字符串",
        Stack(
          children: <Widget>[
            StringWidget(
              "↖",
              width: 100,
              height: 100,
              horizontalTextAlign: TextAlign.left,
              verticalAlign: VerticalAlign.top,
            ),
            StringWidget(
              "↑",
              width: 100,
              height: 100,
              horizontalTextAlign: TextAlign.center,
              verticalAlign: VerticalAlign.top,
            ),
            StringWidget(
              "↗",
              width: 100,
              height: 100,
              horizontalTextAlign: TextAlign.right,
              verticalAlign: VerticalAlign.top,
            ),
            StringWidget(
              "←",
              width: 100,
              height: 100,
              horizontalTextAlign: TextAlign.left,
              verticalAlign: VerticalAlign.center,
            ),
            StringWidget(
              "+",
              width: 100,
              height: 100,
              horizontalTextAlign: TextAlign.center,
              verticalAlign: VerticalAlign.center,
            ),
            StringWidget(
              "→",
              width: 100,
              height: 100,
              horizontalTextAlign: TextAlign.right,
              verticalAlign: VerticalAlign.center,
            ),
            StringWidget(
              "↙",
              width: 100,
              height: 100,
              horizontalTextAlign: TextAlign.left,
              verticalAlign: VerticalAlign.bottom,
            ),
            StringWidget(
              "↓",
              width: 100,
              height: 100,
              horizontalTextAlign: TextAlign.center,
              verticalAlign: VerticalAlign.bottom,
            ),
            StringWidget(
              "↘",
              width: 100,
              height: 100,
              horizontalTextAlign: TextAlign.right,
              verticalAlign: VerticalAlign.bottom,
            )
          ],
        )));
  }

  void initStateWidgets() {
    items
      ..add(_buildItem(
          "状态图标",
          Wrap(
            children: <Widget>[
              StateWidget("进行中", color: Colors.blue, size: 60),
              StateWidget("已删除", color: Colors.red, size: 100, fontSize: 18),
              StateWidget("已完成", color: Colors.green, size: 180, fontSize: 38)
            ],
          )));
  }

  void initFiveWidgets() {
    items
      ..add(_buildItem(
          "五角星",
          Wrap(
            children: <Widget>[
              FiveStarWidget(50),
              FiveStarWidget(50, rotateAngle: 30),
              FiveStarWidget(50, rotateAngle: 60, color: Colors.blue),
              FiveStarWidget(50, rotateAngle: 90, color: Colors.blue),
              FiveStarWidget(50, rotateAngle: 120),
              FiveStarWidget(50, rotateAngle: 140)
            ],
          )));
  }

  void initArcWidgets() {
    items
      ..add(_buildItem(
          "圆弧、圆",
          Wrap(
            children: <Widget>[
              ArcWidget(50,
                  startAngle: 0.0,
                  sweepAngle: 300.0,
                  color: Colors.red,
                  strokeWidth: 15,
                  borderColor: Colors.grey[200]),
              ArcWidget(100,
                  startAngle: 0.0, sweepAngle: 90.0, color: Colors.red, strokeWidth: 15, borderColor: Colors.grey[200]),
              ArcWidget(200,
                  startAngle: 270.0,
                  sweepAngle: 90.0,
                  color: Colors.red,
                  strokeWidth: 15,
                  borderColor: Colors.grey[200]),
              ArcWidget(300, startAngle: 0.0, sweepAngle: 360.0, color: Colors.red, strokeWidth: 10),
              ArcWidget(50, color: Colors.red),
              ArcWidget(50, startAngle: 0.0, sweepAngle: 90.0),
              ArcWidget(50, startAngle: 0.0, sweepAngle: 180.0),
              ArcWidget(50, startAngle: 0.0, sweepAngle: 270.0),
            ],
          )));
  }

  Widget _buildItem(String title, Widget widget) =>
      ListTile(title: Text(title ?? ''), onTap: () => gotoPage(widget, title));

  void gotoPage(Widget widget, String title) => Navigator.push(
      context, MaterialPageRoute(builder: (ctx) => Scaffold(appBar: AppBar(title: Text(title ?? '')), body: widget)));
}
