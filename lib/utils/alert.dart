import 'package:flutter/material.dart';
import 'package:warehousemanagement/inventory/status_of_inventory/status_ui.dart';
import '../main.dart';

class LowInventoryAlert extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Inventory is low'),
      content: Text(
          'There is at least one product which is less than 10kg remaining.\n Do you want to check your inventory?'),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => StatusUi(
                  currentInventoryDatabase: currentInventoryDatabase!,
                  salesInventoryDatabase: salesInventoryDatabase!,
                ),
              ),
            );
          },
          child: Text('Yes'),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('No'),
        ),
      ],
    );
  }
}
