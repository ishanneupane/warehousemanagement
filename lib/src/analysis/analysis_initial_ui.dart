import 'package:flutter/material.dart';
import 'package:warehousemanagement/src/analysis/farmer_analysis/farmer.dart';
import 'package:warehousemanagement/src/analysis/sales_analysis/product_analysis_initial_ui.dart';
import '../inventory/arrival/inventory_arrival_ui.dart';

class AnalysisInitialUi extends StatelessWidget {
  final List<Map<String, dynamic>> buttons = [
    {'name': 'Farmer Analysis', 'icon': Icons.person_pin_sharp},
    {'name': 'Sales Analysis', 'icon': Icons.attach_money},
    {'name': 'Price Fluctuation Analysis', 'icon': Icons.trending_up_sharp},
    {'name': 'Sales Prediction', 'icon': Icons.batch_prediction}
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
                        builder: (context) => FarmerUi(),
                      ));
                  break;
                case 1:
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductAnalysisInitialUi(),
                      ));
                  break;
                case 2:
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductAnalysisInitialUi(),
                    ),
                  );
                  break;
                case 3:
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductAnalysisInitialUi(),
                    ),
                  );
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
