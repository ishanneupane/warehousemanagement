import 'package:flutter/material.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart' as sql;
import 'package:warehousemanagement/inventory/status_of_inventory/status.dart';

class StatusUi extends StatelessWidget {
  final sql.Database currentInventoryDatabase;
  final sql.Database salesInventoryDatabase;

  StatusUi(
      {required this.currentInventoryDatabase,
      required this.salesInventoryDatabase});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inventory'),
      ),
      body: FutureBuilder<Map<String, double>>(
        future: InventoryCalculator.calculateWeightDifference(
            currentInventoryDatabase, salesInventoryDatabase),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final weightDifferences = snapshot.data ?? {};
            return ListView.builder(
              itemCount: weightDifferences.length,
              itemBuilder: (context, index) {
                final productName = weightDifferences.keys.elementAt(index);
                final weightDifference = weightDifferences[productName];
                return ListTile(
                  title: Text(productName),
                  subtitle: Text(
                      'REMAINING KGs: ${weightDifference?.toStringAsFixed(4)}'),
                );
              },
            );
          }
        },
      ),
    );
  }
}
