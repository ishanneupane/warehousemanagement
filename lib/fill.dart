import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class PercentIndicatorDemo extends StatefulWidget {
  @override
  _PercentIndicatorDemoState createState() => _PercentIndicatorDemoState();
}

class _PercentIndicatorDemoState extends State<PercentIndicatorDemo> {
  double percent = 0.0;

  late double _height;
  late double _width;

  @override
  initState() {
    Timer timer;
    timer = Timer.periodic(Duration(milliseconds: 10000), (_) {
      setState(() {
        percent += 10;
        if (percent >= 100) {
          timer = 0.0 as Timer;
        }
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height * .0022;
    _width = MediaQuery.of(context).size.width * .0022;

    return Container(
        child: Container(
            child: Column(
      children: <Widget>[
        Column(
          children: [
            Text(
              'Total Inventory Remaining',
              style: TextStyle(
                  color: Colors.white,
                  fontStyle: FontStyle.italic,
                  fontSize: 25),
            ),
            Container(
                padding: EdgeInsets.all(10),
                child: CircularPercentIndicator(
                  radius: 120.0,
                  lineWidth: 10.0,
                  animation: true,
                  percent: percent / 100,
                  center: Text(
                    percent.toString() + "%",
                    style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                  backgroundColor: Colors.grey,
                  circularStrokeCap: CircularStrokeCap.round,
                  progressColor: Colors.blue,
                )),
          ],
        ),
      ],
    )));
  }
}
