import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class PieChartMaker extends StatefulWidget {
  final List<PieChartSectionData> sections;
  final String title;

  const PieChartMaker({Key? key, required this.sections, required this.title})
      : super(key: key);

  @override
  _PieChartMakerState createState() => _PieChartMakerState();
}

class _PieChartMakerState extends State<PieChartMaker> {
  int? touchedIndex;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            widget.title,
            style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        ),
        Expanded(
          child: PieChart(
            PieChartData(
              sections: widget.sections,
              pieTouchData: PieTouchData(touchCallback:
                  (FlTouchEvent event, PieTouchResponse? response) {
                setState(() {
                  if (event is FlLongPressEnd) {
                    touchedIndex = -1; // Reset the touchedIndex when touch ends
                  } else {
                    touchedIndex =
                        response?.touchedSection?.touchedSectionIndex;
                  }
                });
              }),
            ),
          ),
        ),
        if (touchedIndex != null && touchedIndex! >= 0)
          Text(
            'Weight(KG): ${widget.sections[touchedIndex!].value.toStringAsFixed(2)}',
            style: TextStyle(color: Colors.white),
          ),
      ],
    );
  }
}
