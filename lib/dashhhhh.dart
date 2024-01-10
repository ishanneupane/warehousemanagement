import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WarehouseDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: GridView.count(
        crossAxisCount: 4,
        mainAxisSpacing: 25,
        children: [
          // Define tiles for various functionalities
          WarehouseTile(
            title: 'Inventory Items',
            icon: Icons.storage,
            onPressed: () {
              // Handle Inventory Management action
            },
          ),
          WarehouseTile(
            title: 'Order Processing',
            icon: Icons.shopping_cart,
            onPressed: () {
              // Handle Order Processing action
            },
          ),
          WarehouseTile(
            title: 'Generate Report',
            icon: CupertinoIcons.book,
            onPressed: () {
              // Handle Order Processing action
            },
          ),
          WarehouseTile(
            title: 'Add more',
            icon: CupertinoIcons.plus_app,
            onPressed: () {
              // Handle Order Processing action
            },
          ),

          // Add more tiles as needed
        ],
      ),
    );
  }
}

class WarehouseTile extends StatelessWidget {
  final String title;
  final IconData icon;
  final Function onPressed;

  WarehouseTile(
      {required this.title, required this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onPressed(),
      child: Card(
        color: Color(0xCA0D0D41),
        elevation: 4,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 30.0,
              color: Colors.white70,
            ),
            SizedBox(height: 8.0),
            Text(title, style: TextStyle(fontSize: 16.0, color: Colors.white)),
          ],
        ),
      ),
    );
  }
}

Widget add(String a, IconData b, Function c) {
  return GestureDetector(
    onTap: () => c(),
    child: Card(
      elevation: 3,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(b, size: 48.0),
          SizedBox(height: 8.0),
          Text(a, style: TextStyle(fontSize: 16.0)),
        ],
      ),
    ),
  );
}
