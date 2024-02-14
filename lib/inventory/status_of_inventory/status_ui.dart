import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart' as sql;
import 'package:warehousemanagement/inventory/status_of_inventory/provider.dart';
import 'package:warehousemanagement/inventory/status_of_inventory/status_sql.dart';

class StatusUi extends StatelessWidget {
  final sql.Database currentInventoryDatabase;
  final sql.Database salesInventoryDatabase;

  StatusUi({
    required this.currentInventoryDatabase,
    required this.salesInventoryDatabase,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inventory'),
      ),
      body: Consumer<WeightDifferenceNotifier>(
        builder: (context, state, _) {
          return FutureBuilder<Map<String, double>>(
            future: InventoryCalculator.calculateWeightDifference(
              currentInventoryDatabase,
              salesInventoryDatabase,
            ),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else {
                final weightDifferences = snapshot.data ?? {};
                state.setWeightDifferences(weightDifferences);

                return ListView.builder(
                  itemCount: weightDifferences.length,
                  itemBuilder: (context, index) {
                    final productName = weightDifferences.keys.elementAt(index);
                    final weightDifference = weightDifferences[productName];
                    Color containerColor;
                    if (weightDifference != null) {
                      if (weightDifference < 50) {
                        containerColor = Colors.red;
                      } else if (weightDifference >= 50 &&
                          weightDifference < 100) {
                        containerColor = Colors.orange;
                      } else {
                        containerColor = Colors.green;
                      }
                    } else {
                      containerColor = Colors
                          .grey; // Handle null or missing weightDifference
                    }

                    return Column(
                      children: [
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          color: containerColor,
                          child: ListTile(
                            title: Text(productName),
                            subtitle: Text(
                                'REMAINING KGs: ${weightDifference?.toStringAsFixed(4)}'),
                          ),
                        ),
                      ],
                    );
                  },
                );
              }
            },
          );
        },
      ),
    );
  }
}
