import 'package:flutter/material.dart';
import 'package:warehousemanagement/src/inventory/sales/sales_ui.dart';
import 'package:warehousemanagement/src/inventory/status_of_inventory/status_ui.dart';

import 'arrival/inventory_arrival_ui.dart';

class InventoryInitialUi extends StatelessWidget {
  final List<Map<String, dynamic>> buttons = [
    {'name': 'Arrivals', 'icon': Icons.local_shipping},
    {'name': 'Sales', 'icon': Icons.attach_money},
    {'name': 'Status', 'icon': Icons.add_alert},
    {'name': 'History', 'icon': Icons.history_outlined}
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade800,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade800,
        title: Center(
          child: Text(
            'Inventory Management',
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
                        builder: (context) => ArrivalUi(),
                      ));
                  break;
                case 1:
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SalesUi(),
                      ));
                  break;
                case 2:
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => StatusUi(
                        currentInventoryDatabase: currentInventoryDatabase!,
                        salesInventoryDatabase: salesInventoryDatabase!,
                      ),
                    ),
                  );
                  break;

                case 3:
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => InventoryHistoryUi(),
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
