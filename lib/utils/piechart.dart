import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class PieChartMaker extends StatefulWidget {
  final List<PieChartSectionData> sections;

  const PieChartMaker({Key? key, required this.sections}) : super(key: key);

  @override
  _PieChartMakerState createState() => _PieChartMakerState();
}

class _PieChartMakerState extends State<PieChartMaker>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  List<PieChartSectionData> _currentSections = [];

  @override
  void initState() {
    super.initState();
    _currentSections = widget.sections;

    _controller =
        AnimationController(duration: Duration(seconds: 1), vsync: this);
    _animation = Tween<double>(begin: 10, end: 100).animate(_controller)
      ..addListener(() {
        setState(() {}); // Rebuild the widget when the animation value changes
      });

    _controller.forward(); // Start the animation
  }

  @override
  void dispose() {
    _controller.dispose(); // Clean up the animation controller
    super.dispose();
  }

  void updateChartData(List<PieChartSectionData> sections) {
    setState(() {
      _currentSections = sections;
    });
  }

  @override
  Widget build(BuildContext context) {
    return PieChart(
      PieChartData(
        centerSpaceRadius: _animation.value,
        sections: _currentSections,
      ),
      swapAnimationDuration: Duration(seconds: 5),
      swapAnimationCurve: Curves.easeInOutQuad,
    );
  }
}
