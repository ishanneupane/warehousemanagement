import 'package:flutter/material.dart';
import 'package:warehousemanagement/inventory/Inventory_history/inventory_history_ui.dart';
import 'package:warehousemanagement/inventory/arrival/inventory_arrival_ui.dart';

import '../registration/register_ui.dart';

class InventoryInitialUi extends StatelessWidget {
  final List<Map<String, dynamic>> buttons = [
    {'name': 'Sales', 'icon': Icons.attach_money},
    {'name': 'Arrivals', 'icon': Icons.local_shipping},
    {'name': 'Status', 'icon': Icons.add_alert},
    {'name': 'History', 'icon': Icons.history_outlined}
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Warehouse Management'),
      ),
      body: GridView.builder(
        itemCount: buttons.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 5,
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
                        builder: (context) => RegistrationScreen(),
                      )); // Handle Sales button tap
                  break;
                case 1:
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ArrivalUi(),
                      )); // Handle Arrivals button tap
                  break;
                case 2:
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RegistrationScreen(),
                      )); // Handle Others button tap
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
              color: Colors.blue,
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
