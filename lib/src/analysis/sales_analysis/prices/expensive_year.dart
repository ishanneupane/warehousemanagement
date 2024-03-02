import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../../../core/widget/piechart.dart';

class ExpensiveYear extends StatelessWidget {
  final List<List<PieChartSectionData>> chartData = [
    [
      PieChartSectionData(
        value: 750,
        color: Colors.red,
        title: "lime",
        titleStyle: TextStyle(color: Colors.white),
      ),
      PieChartSectionData(
        value: 130,
        color: Colors.yellow,
        title: "apple",
        titleStyle: TextStyle(color: Colors.white),
      ),
      PieChartSectionData(
        value: 160,
        color: Colors.pink,
        title: "okra",
        titleStyle: TextStyle(color: Colors.white),
      ),
      PieChartSectionData(
        value: 190,
        color: Colors.green,
        title: "mango",
        titleStyle: TextStyle(color: Colors.white),
      ),
      PieChartSectionData(
        value: 220,
        color: Colors.blue,
        title: "grapes",
        titleStyle: TextStyle(color: Colors.white),
      ),
    ],
    [
      PieChartSectionData(
        value: 1500,
        color: Colors.red,
        title: "lime",
        titleStyle: TextStyle(color: Colors.white),
      ),
      PieChartSectionData(
        value: 160,
        color: Colors.yellow,
        title: "carrot",
        titleStyle: TextStyle(color: Colors.white),
      ),
      PieChartSectionData(
        value: 200,
        color: Colors.pink,
        title: "mango",
        titleStyle: TextStyle(color: Colors.white),
      ),
      PieChartSectionData(
        value: 240,
        color: Colors.green,
        title: "grapes",
        titleStyle: TextStyle(color: Colors.white),
      ),
      PieChartSectionData(
        value: 550,
        color: Colors.blue,
        title: "banana",
        titleStyle: TextStyle(color: Colors.white),
      ),
    ],
    [
      PieChartSectionData(
        value: 380,
        color: Colors.red,
        title: "lime",
        titleStyle: TextStyle(color: Colors.white),
      ),
      PieChartSectionData(
        value: 200,
        color: Colors.yellow,
        title: "grapes",
        titleStyle: TextStyle(color: Colors.white),
      ),
      PieChartSectionData(
        value: 200,
        color: Colors.pink,
        title: "carrot",
        titleStyle: TextStyle(color: Colors.white),
      ),
      PieChartSectionData(
        value: 200,
        color: Colors.green,
        title: "brocauli",
        titleStyle: TextStyle(color: Colors.white),
      ),
      PieChartSectionData(
        value: 350,
        color: Colors.blue,
        title: "apple",
        titleStyle: TextStyle(color: Colors.white),
      ),
    ],
    [
      PieChartSectionData(
        value: 420,
        color: Colors.red,
        title: "grapes",
        titleStyle: TextStyle(color: Colors.white),
      ),
      PieChartSectionData(
        value: 150,
        color: Colors.yellow,
        title: "mango",
        titleStyle: TextStyle(color: Colors.white),
      ),
      PieChartSectionData(
        value: 190,
        color: Colors.pink,
        title: "carrot",
        titleStyle: TextStyle(color: Colors.white),
      ),
      PieChartSectionData(
        value: 320,
        color: Colors.green,
        title: "apple",
        titleStyle: TextStyle(color: Colors.white),
      ),
      PieChartSectionData(
        value: 350,
        color: Colors.blue,
        title: "lime",
        titleStyle: TextStyle(color: Colors.white),
      ),
    ],
    [
      PieChartSectionData(
        value: 400,
        color: Colors.red,
        title: "grapes",
        titleStyle: TextStyle(color: Colors.white),
      ),
      PieChartSectionData(
        value: 140,
        color: Colors.yellow,
        title: "okra",
        titleStyle: TextStyle(color: Colors.white),
      ),
      PieChartSectionData(
        value: 150,
        color: Colors.pink,
        title: "mango",
        titleStyle: TextStyle(color: Colors.white),
      ),
      PieChartSectionData(
        value: 300,
        color: Colors.green,
        title: "lime",
        titleStyle: TextStyle(color: Colors.white),
      ),
      PieChartSectionData(
        value: 300,
        color: Colors.blue,
        title: "apple",
        titleStyle: TextStyle(color: Colors.white),
      ),
    ],
  ];

  final List<String> chartTitles = [
    'Top 5 Most Expensive Products in 2017',
    'Top 5 Most Expensive Products in 2018',
    'Top 5 Most Expensive Products in 2019',
    'Top 5 Most Expensive Products in 2020',
    'Top 5 Most Expensive Products in 2021',
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
