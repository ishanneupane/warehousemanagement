import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class PieChartMaker extends StatelessWidget {
  const PieChartMaker({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Text("PieChart"),
        PieChart(
          swapAnimationDuration: Duration(seconds: 5),
          swapAnimationCurve: Curves.bounceOut,
          PieChartData(
            sections: [
              PieChartSectionData(value: 20, color: Colors.red),
              PieChartSectionData(value: 20, color: Colors.green),
              PieChartSectionData(value: 20, color: Colors.yellow),
              PieChartSectionData(value: 20, color: Colors.blue),
            ],
          ),
        )
      ],
    );
  }
}
