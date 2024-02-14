import 'package:flutter/material.dart';
import 'package:warehousemanagement/analysis/sales_analysis/cheap_season.dart';
import 'package:warehousemanagement/analysis/sales_analysis/cheap_year.dart';
import 'package:warehousemanagement/analysis/sales_analysis/expensive_season.dart';
import 'package:warehousemanagement/analysis/sales_analysis/expensive_year.dart';
import 'package:warehousemanagement/inventory/Inventory_history/inventory_history_ui.dart';
import 'package:warehousemanagement/inventory/sales/sales_ui.dart';

class PricingUi extends StatelessWidget {
  final List<Map<String, dynamic>> buttons = [
    {'name': 'Expensive Product Per Year', 'icon': Icons.calendar_month},
    {'name': 'Least Product Per Year', 'icon': Icons.calendar_today_rounded},
    {'name': 'Expensive Product Per Season', 'icon': Icons.spa},
    {'name': 'Least Product Per Season', 'icon': Icons.spa_outlined}
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade800,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade800,
        title: Center(
          child: Text(
            'ANALYSIS',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      body: GridView.builder(
        itemCount: buttons.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0,
        ),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              switch (index) {
                case 0:
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ExpensiveYear(),
                      ));
                  break;
                case 1:
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CheapYear(),
                      ));
                  break;
                case 2:
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ExpensiveSeason(),
                    ),
                  );
                  break;

                case 3:
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CheapSeason(),
                      ));
                  break;
              }
            },
            child: Container(
              color: Colors.blue.shade900,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    buttons[index]['icon'],
                    size: 50.0,
                    color: Colors.white,
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    buttons[index]['name'],
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
