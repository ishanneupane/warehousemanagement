import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart' as sql;
import 'package:warehousemanagement/src/inventory/status_of_inventory/provider.dart';
import 'package:warehousemanagement/src/inventory/status_of_inventory/status_sql.dart';

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
      backgroundColor: Colors.brown.shade200,
      appBar: AppBar(
        backgroundColor: Colors.brown.shade300,
        title: Center(
            child: Text(
          'Inventory Status',
          style: TextStyle(fontSize: 30),
        )),
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
                        containerColor = Colors.red.shade900;
                      } else if (weightDifference >= 50 &&
                          weightDifference < 100) {
                        containerColor = Colors.orange.shade400;
                      } else {
                        containerColor = Colors.green.shade700;
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
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(40)),
                            color: containerColor,
                          ),
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
