import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../../../core/widget/piechart.dart';

class ExpensiveSeason extends StatelessWidget {
  final List<List<PieChartSectionData>> chartData = [
    [
      PieChartSectionData(
        value: 800,
        color: Colors.red,
        title: "lime",
        titleStyle: TextStyle(color: Colors.black),
      ),
      PieChartSectionData(
        value: 200,
        color: Colors.yellow,
        title: "carrot",
        titleStyle: TextStyle(color: Colors.black),
      ),
      PieChartSectionData(
        value: 200,
        color: Colors.pink,
        title: "brocauli",
        titleStyle: TextStyle(color: Colors.black),
      ),
      PieChartSectionData(
        value: 320,
        color: Colors.green,
        title: "apple",
        titleStyle: TextStyle(color: Colors.black),
      ),
      PieChartSectionData(
        value: 420,
        color: Colors.blue,
        title: "grapes",
        titleStyle: TextStyle(color: Colors.black),
      ),
    ],
    [
      PieChartSectionData(
        value: 660,
        color: Colors.red,
        title: "mango",
        titleStyle: TextStyle(color: Colors.black),
      ),
      PieChartSectionData(
        value: 300,
        color: Colors.yellow,
        title: "grapes",
        titleStyle: TextStyle(color: Colors.black),
      ),
      PieChartSectionData(
        value: 350,
        color: Colors.pink,
        title: "apple",
        titleStyle: TextStyle(color: Colors.black),
      ),
      PieChartSectionData(
        value: 450,
        color: Colors.green,
        title: "banana",
        titleStyle: TextStyle(color: Colors.black),
      ),
      PieChartSectionData(
        value: 650,
        color: Colors.blue,
        title: "lime",
        titleStyle: TextStyle(color: Colors.black),
      ),
    ],
    [
      PieChartSectionData(
        value: 550,
        color: Colors.red,
        title: "lime",
        titleStyle: TextStyle(color: Colors.black),
      ),
      PieChartSectionData(
        value: 150,
        color: Colors.yellow,
        title: "papaya",
        titleStyle: TextStyle(color: Colors.black),
      ),
      PieChartSectionData(
        value: 190,
        color: Colors.pink,
        title: "okra",
        titleStyle: TextStyle(color: Colors.black),
      ),
      PieChartSectionData(
        value: 300,
        color: Colors.green,
        title: "apple",
        titleStyle: TextStyle(color: Colors.black),
      ),
      PieChartSectionData(
        value: 400,
        color: Colors.blue,
        title: "grapes",
        titleStyle: TextStyle(color: Colors.black),
      ),
    ],
    [
      PieChartSectionData(
        value: 1500,
        color: Colors.red,
        title: "lime",
        titleStyle: TextStyle(color: Colors.black),
      ),
      PieChartSectionData(
        value: 210,
        color: Colors.yellow,
        title: "mango",
        titleStyle: TextStyle(color: Colors.black),
      ),
      PieChartSectionData(
        value: 300,
        color: Colors.pink,
        title: "aaple",
        titleStyle: TextStyle(color: Colors.black),
      ),
      PieChartSectionData(
        value: 400,
        color: Colors.green,
        title: "grapes",
        titleStyle: TextStyle(color: Colors.black),
      ),
      PieChartSectionData(
        value: 550,
        color: Colors.blue,
        title: "banana",
        titleStyle: TextStyle(color: Colors.black),
      ),
    ],
  ];

  final List<String> chartTitles = [
    'Top 5 Cheapest Products in Autumn',
    'Top 5 Cheapest Products in Summer',
    'Top 5 Cheapest Products in Winter',
    'Top 5 Cheapest Products in Spring',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade800,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade900,
        title: Center(
          child: Text(
            'ANALYSIS',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      body: GridView.builder(
        itemCount: chartData.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0,
        ),
        itemBuilder: (context, index) {
          return Expanded(
            child: PieChartMaker(
                sections: chartData[index], title: chartTitles[index]),
          );
        },
      ),
    );
  }
}
