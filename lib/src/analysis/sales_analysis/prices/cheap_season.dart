import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import '../../../../core/widget/piechart.dart';

class CheapSeason extends StatelessWidget {
  final List<List<PieChartSectionData>> chartData = [
    [
      PieChartSectionData(
        value: 100,
        color: Colors.red,
        title: "jack fruit",
        titleStyle: TextStyle(color: Colors.black),
      ),
      PieChartSectionData(
        value: 60,
        color: Colors.yellow,
        title: "radish red",
        titleStyle: TextStyle(color: Colors.black),
      ),
      PieChartSectionData(
        value: 120,
        color: Colors.pink,
        title: "brinjal long",
        titleStyle: TextStyle(color: Colors.black),
      ),
      PieChartSectionData(
        value: 115,
        color: Colors.green,
        title: "potato red",
        titleStyle: TextStyle(color: Colors.black),
      ),
      PieChartSectionData(
        value: 100,
        color: Colors.blue,
        title: "potato white",
        titleStyle: TextStyle(color: Colors.black),
      ),
    ],
    [
      PieChartSectionData(
        value: 60,
        color: Colors.red,
        title: "potato red",
        titleStyle: TextStyle(color: Colors.black),
      ),
      PieChartSectionData(
        value: 40,
        color: Colors.yellow,
        title: "potato white",
        titleStyle: TextStyle(color: Colors.black),
      ),
      PieChartSectionData(
        value: 100,
        color: Colors.pink,
        title: "tomato big",
        titleStyle: TextStyle(color: Colors.black),
      ),
      PieChartSectionData(
        value: 100,
        color: Colors.green,
        title: "raddish red",
        titleStyle: TextStyle(color: Colors.black),
      ),
      PieChartSectionData(
        value: 100,
        color: Colors.blue,
        title: "potato brinjal",
        titleStyle: TextStyle(color: Colors.black),
      ),
    ],
    [
      PieChartSectionData(
        value: 50,
        color: Colors.red,
        title: "raddish red",
        titleStyle: TextStyle(color: Colors.black),
      ),
      PieChartSectionData(
        value: 50,
        color: Colors.yellow,
        title: "potato white",
        titleStyle: TextStyle(color: Colors.black),
      ),
      PieChartSectionData(
        value: 100,
        color: Colors.pink,
        title: "tomato small",
        titleStyle: TextStyle(color: Colors.black),
      ),
      PieChartSectionData(
        value: 80,
        color: Colors.green,
        title: "brinjal long",
        titleStyle: TextStyle(color: Colors.black),
      ),
      PieChartSectionData(
        value: 74,
        color: Colors.blue,
        title: "potato red",
        titleStyle: TextStyle(color: Colors.black),
      ),
    ],
    [
      PieChartSectionData(
        value: 80,
        color: Colors.red,
        title: "brinjal long",
        titleStyle: TextStyle(color: Colors.black),
      ),
      PieChartSectionData(
        value: 78,
        color: Colors.yellow,
        title: "potato white",
        titleStyle: TextStyle(color: Colors.black),
      ),
      PieChartSectionData(
        value: 90,
        color: Colors.pink,
        title: "potato red",
        titleStyle: TextStyle(color: Colors.black),
      ),
      PieChartSectionData(
        value: 85,
        color: Colors.green,
        title: "tomato small",
        titleStyle: TextStyle(color: Colors.black),
      ),
      PieChartSectionData(
        value: 80,
        color: Colors.blue,
        title: "radish red",
        titleStyle: TextStyle(color: Colors.black),
      ),
    ],
  ];

  final List<String> chartTitles = [
    'Top 5 Cheapest Products in Autumn',
    'Top 5 Cheapest Products in Spring',
    'Top 5 Cheapest Products in Summer',
    'Top 5 Cheapest Products in Winter',
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
