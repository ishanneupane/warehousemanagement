import 'package:flutter/material.dart';
import 'package:warehousemanagement/inventory/Inventory_history/inventory_history_ui.dart';

class InventoryInitialUi extends StatelessWidget {
  const InventoryInitialUi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => InventoryHistoryUi()));
              },
              child: Text("Ram"))
        ],
      ),
    );
  }
}
