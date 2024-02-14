import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:warehousemanagement/utils/piechart.dart';

class CheapYear extends StatelessWidget {
  final List<List<PieChartSectionData>> chartData = [
    [
      PieChartSectionData(
        value: 50,
        color: Colors.red,
        title: "Red Potato",
        titleStyle: TextStyle(color: Colors.white),
      ),
      PieChartSectionData(
        value: 40,
        color: Colors.yellow,
        title: "Raddish Red",
        titleStyle: TextStyle(color: Colors.white),
      ),
      PieChartSectionData(
        value: 40,
        color: Colors.pink,
        title: "Potato White",
        titleStyle: TextStyle(color: Colors.white),
      ),
      PieChartSectionData(
        value: 100,
        color: Colors.green,
        title: "Brinjal Long",
        titleStyle: TextStyle(color: Colors.white),
      ),
      PieChartSectionData(
        value: 100,
        color: Colors.blue,
        title: "Banana",
        titleStyle: TextStyle(color: Colors.white),
      ),
    ],
    [
      PieChartSectionData(
        value: 58,
        color: Colors.red,
        title: "Potato White",
        titleStyle: TextStyle(color: Colors.white),
      ),
      PieChartSectionData(
        value: 50,
        color: Colors.yellow,
        title: "Raddish Red",
        titleStyle: TextStyle(color: Colors.white),
      ),
      PieChartSectionData(
        value: 75,
        color: Colors.pink,
        title: "Potato Red",
        titleStyle: TextStyle(color: Colors.white),
      ),
      PieChartSectionData(
        value: 80,
        color: Colors.green,
        title: "Tomato Big",
        titleStyle: TextStyle(color: Colors.white),
      ),
      PieChartSectionData(
        value: 80,
        color: Colors.blue,
        title: "Tomato Small",
        titleStyle: TextStyle(color: Colors.white),
      ),
    ],
    [
      PieChartSectionData(
        value: 75,
        color: Colors.red,
        title: "Potato Red",
        titleStyle: TextStyle(color: Colors.white),
      ),
      PieChartSectionData(
        value: 48,
        color: Colors.yellow,
        title: "Potato White",
        titleStyle: TextStyle(color: Colors.white),
      ),
      PieChartSectionData(
        value: 25,
        color: Colors.pink,
        title: "Raddish Red",
        titleStyle: TextStyle(color: Colors.white),
      ),
      PieChartSectionData(
        value: 100,
        color: Colors.green,
        title: "Jack Fruit",
        titleStyle: TextStyle(color: Colors.white),
      ),
      PieChartSectionData(
        value: 100,
        color: Colors.blue,
        title: "Brinjal Long",
        titleStyle: TextStyle(color: Colors.white),
      ),
    ],
    [
      PieChartSectionData(
        value: 115,
        color: Colors.red,
        title: "Potato Red",
        titleStyle: TextStyle(color: Colors.white),
      ),
      PieChartSectionData(
        value: 100,
        color: Colors.yellow,
        title: "Potato White",
        titleStyle: TextStyle(color: Colors.white),
      ),
      PieChartSectionData(
        value: 60,
        color: Colors.pink,
        title: "Raddish Red",
        titleStyle: TextStyle(color: Colors.white),
      ),
      PieChartSectionData(
        value: 115,
        color: Colors.green,
        title: "Tomato Small",
        titleStyle: TextStyle(color: Colors.white),
      ),
      PieChartSectionData(
        value: 120,
        color: Colors.blue,
        title: "Brinjal Long",
        titleStyle: TextStyle(color: Colors.white),
      ),
    ],
    [
      PieChartSectionData(
        value: 50,
        color: Colors.red,
        title: "Potato Red",
        titleStyle: TextStyle(color: Colors.white),
      ),
      PieChartSectionData(
        value: 40,
        color: Colors.yellow,
        title: "Potato White",
        titleStyle: TextStyle(color: Colors.white),
      ),
      PieChartSectionData(
        value: 25,
        color: Colors.pink,
        title: "Tomato Big",
        titleStyle: TextStyle(color: Colors.white),
      ),
      PieChartSectionData(
        value: 80,
        color: Colors.green,
        title: "Brimjal Long",
        titleStyle: TextStyle(color: Colors.white),
      ),
      PieChartSectionData(
        value: 60,
        color: Colors.blue,
        title: "Tomato Small",
        titleStyle: TextStyle(color: Colors.white),
      ),
    ],
  ];

  final List<String> chartTitles = [
    'Top 5 Cheapest Products in 2017',
    'Top 5 Cheapest Products in 2018',
    'Top 5 Cheapest Products in 2019',
    'Top 5 Cheapest Products in 2020',
    'Top 5 Cheapest Products in 2021',
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
