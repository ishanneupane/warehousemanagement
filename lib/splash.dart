import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Warehouse Management System',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DashboardPage(),
    );
  }
}

class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('WMS Dashboard'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Dashboard Overview
            Text('Dashboard Overview'),
            // Graphical representation of key metrics goes here

            // Quick Actions
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    onPressed: () {}, child: Text('Add New Inventory')),
                ElevatedButton(onPressed: () {}, child: Text('Create Order')),
                ElevatedButton(
                    onPressed: () {}, child: Text('Generate Report')),
              ],
            ),

            // Notifications
            Text('Notifications'),
            // Notification area goes here
          ],
        ),
      ),
    );
  }
}
